import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/test_question.dart';
import '../models/test_result.dart';
import 'api_service.dart';
import 'auth_service.dart';

class TestService {
  static const String _resultsKey = 'user_test_results';
  static const String _temporaryResultKey = 'temporary_test_result';
  static const String baseUrl = 'http://192.168.10.7:3000/api';

  // =========================
  // RESULTADO TEMPORÁRIO
  // =========================

  static Future<void> saveTemporaryResult(TestResult result) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_temporaryResultKey, json.encode(result.toJson()));
      print('✅ [TestService] Resultado temporário salvo');
    } catch (e) {
      print('❌ [TestService] Erro ao salvar resultado temporário: $e');
    }
  }

  static Future<TestResult?> getTemporaryResult() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final resultJson = prefs.getString(_temporaryResultKey);
      if (resultJson != null) {
        final resultMap = json.decode(resultJson);
        return TestResult.fromJson(resultMap);
      }
      return null;
    } catch (e) {
      print('❌ [TestService] Erro ao carregar resultado temporário: $e');
      return null;
    }
  }

  static Future<void> clearTemporaryResult() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_temporaryResultKey);
      print('✅ [TestService] Resultado temporário removido');
    } catch (e) {
      print('❌ [TestService] Erro ao remover resultado temporário: $e');
    }
  }

  static Future<void> migrateTemporaryResult(String userId) async {
    try {
      final temporaryResult = await getTemporaryResult();
      if (temporaryResult != null) {
        // Criar nova instância com o userId correto
        final permanentResult = TestResult(
          id: temporaryResult.id,
          userId: userId,
          completedAt: temporaryResult.completedAt,
          areaScores: temporaryResult.areaScores,
          topAreas: temporaryResult.topAreas,
          responses: temporaryResult.responses,
          summary: temporaryResult.summary,
        );

        // Salvar como resultado permanente
        await saveTestResult(permanentResult);

        // Limpar resultado temporário
        await clearTemporaryResult();

        print('✅ [TestService] Resultado temporário migrado para usuário: $userId');
      }
    } catch (e) {
      print('❌ [TestService] Erro ao migrar resultado temporário: $e');
    }
  }

  // =========================
  // PERGUNTAS DO TESTE
  // =========================

  static Future<List<TestQuestion>> getQuestions() async {
    try {
      print('🚀 [TestService] Carregando perguntas da API...');
      
      // 🔥 AGORA PODE USAR A API NOVAMENTE (backend corrigido)
      final response = await ApiService.getTestQuestions();
      if (response != null && response.isNotEmpty) {
        print('✅ [TestService] ${response.length} questões carregadas da API');
        return response;
      }
      
      // Fallback para perguntas locais
      final questions = _getDefaultQuestions();
      print('📱 [TestService] ${questions.length} questões carregadas localmente (fallback)');
      return questions;
    } catch (e) {
      print('❌ [TestService] Erro ao carregar perguntas: $e');
      return _getDefaultQuestions();
    }
  }

  // =========================
  // SALVAR RESULTADO
  // =========================

  static Future<void> saveTestResult(TestResult result) async {
    try {
      // Salvar localmente
      final prefs = await SharedPreferences.getInstance();
      final results = await getUserTestResults(result.userId);
      results.add(result);

      await prefs.setString(
        '${_resultsKey}_${result.userId}',
        json.encode(results.map((r) => r.toJson()).toList()),
      );

      // Tentar salvar no backend
      await ApiService.saveTestResult(result);

      print('✅ [TestService] Resultado salvo para usuário: ${result.userId}');
    } catch (e) {
      print('❌ [TestService] Erro ao salvar resultado: $e');
    }
  }

  // =========================
  // HISTÓRICO DE RESULTADOS
  // =========================

  static Future<List<TestResult>> getUserTestResults(String userId) async {
    try {
      print('📥 [TestService] Buscando resultados para usuário: $userId');

      // Primeiro tenta buscar da API
      final apiResults = await _getResultsFromAPI();
      if (apiResults.isNotEmpty) {
        print('✅ [TestService] ${apiResults.length} resultados carregados da API');

        // Salvar localmente para cache
        await _saveResultsLocally(userId, apiResults);
        return apiResults;
      }

      // Se API falhar, tenta carregar do cache local
      final localResults = await _getResultsFromLocalStorage(userId);
      print('📱 [TestService] ${localResults.length} resultados carregados do cache local');

      return localResults;
    } catch (e) {
      print('❌ [TestService] Erro ao carregar resultados: $e');
      return [];
    }
  }

  static Future<List<TestResult>> _getResultsFromAPI() async {
    try {
      final token = await AuthService.getToken();
      if (token == null) return [];

      final response = await http.get(
        Uri.parse('$baseUrl/test/results'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          final results = (data['results'] as List)
              .map((r) => TestResult.fromJson(r))
              .toList();
          return results;
        }
      }
      return [];
    } catch (e) {
      print('❌ [TestService] Erro ao buscar da API: $e');
      return [];
    }
  }

  static Future<List<TestResult>> _getResultsFromLocalStorage(String userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final resultsJson = prefs.getString('${_resultsKey}_$userId');

      if (resultsJson != null) {
        final List<dynamic> resultsList = json.decode(resultsJson);
        return resultsList.map((r) => TestResult.fromJson(r)).toList();
      }
      return [];
    } catch (e) {
      print('❌ [TestService] Erro ao carregar do localStorage: $e');
      return [];
    }
  }

  static Future<void> _saveResultsLocally(String userId, List<TestResult> results) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        '${_resultsKey}_$userId',
        json.encode(results.map((r) => r.toJson()).toList()),
      );
      print('💾 [TestService] ${results.length} resultados salvos no cache local');
    } catch (e) {
      print('❌ [TestService] Erro ao salvar no cache: $e');
    }
  }

  // =========================
  // CÁLCULO DO RESULTADO
  // =========================
  //
  // Mantemos o método calculateResult para compatibilidade,
  // mas internamente usamos a nova lógica de múltiplas inteligências.

  static TestResult calculateResult({
    required String userId,
    required List<QuestionResponse> responses,
    required List<TestQuestion> questions, // não usado, mas mantido
  }) {
    return calculateMultipleIntelligencesResult(
      userId: userId,
      responses: responses,
    );
  }

  // 🔥 NOVO: Calcular resultado baseado nas 8 inteligências
  static TestResult calculateMultipleIntelligencesResult({
    required String userId,
    required List<QuestionResponse> responses,
  }) {
    final Map<String, int> intelligenceScores = {
      'interpersonal': 0,
      'naturalist': 0,
      'spatial': 0,
      'logical_mathematical': 0,
      'linguistic': 0,
      'musical': 0,
      'intrapersonal': 0,
      'bodily_kinesthetic': 0,
    };

    // Mapeamento das questões para as inteligências
    final Map<int, String> questionToIntelligence = {
      1: 'interpersonal',
      2: 'naturalist',
      3: 'spatial',
      4: 'logical_mathematical',
      5: 'linguistic',
      6: 'musical',
      7: 'intrapersonal',
      8: 'interpersonal',
      9: 'bodily_kinesthetic',
      10: 'naturalist',
      11: 'spatial',
      12: 'logical_mathematical',
      13: 'linguistic',
      14: 'musical',
      15: 'intrapersonal',
      16: 'interpersonal',
      17: 'bodily_kinesthetic',
      18: 'naturalist',
      19: 'spatial',
      20: 'logical_mathematical',
      21: 'linguistic',
      22: 'musical',
      23: 'intrapersonal',
      24: 'bodily_kinesthetic',
      25: 'bodily_kinesthetic',
      26: 'naturalist',
      27: 'spatial',
      28: 'logical_mathematical',
      29: 'linguistic',
      30: 'musical',
      31: 'intrapersonal',
      32: 'interpersonal',
    };

    // Calcular pontuações
    for (final response in responses) {
      final questionId = int.tryParse(response.questionId);
      if (questionId == null) continue;

      final intelligence = questionToIntelligence[questionId];
      if (intelligence != null) {
        // Converter resposta (texto) para pontuação (0-4)
        final score = _convertResponseToScore(response.optionText);
        intelligenceScores[intelligence] =
            intelligenceScores[intelligence]! + score;
      }
    }

    // Converter para porcentagens (máx 16 pontos por inteligência)
    final Map<String, int> percentageScores = {};
    intelligenceScores.forEach((intelligence, score) {
      percentageScores[intelligence] = ((score / 16) * 100).round();
    });

    // Ordenar por pontuação (maior para menor)
    final sortedEntries = percentageScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final topAreas = sortedEntries.take(3).map((e) => e.key).toList();

    // Gerar resumo personalizado
    final summary = _generateIntelligenceSummary(sortedEntries);

    return TestResult(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      userId: userId,
      completedAt: DateTime.now(),
      areaScores: percentageScores,
      topAreas: topAreas,
      responses: responses,
      summary: summary,
    );
  }

  // Converter resposta em pontuação
  static int _convertResponseToScore(String response) {
    switch (response) {
      case 'Não concordo':
        return 0;
      case 'Concordo parcialmente':
        return 1;
      case 'Neutro':
        return 2;
      case 'Concordo':
        return 3;
      case 'Concordo plenamente':
        return 4;
      default:
        return 0;
    }
  }

  // 🔥 GERAR RESUMO DETALHADO DAS INTELIGÊNCIAS
  static String _generateIntelligenceSummary(List<MapEntry<String, int>> scores) {
    if (scores.isEmpty) return 'Nenhuma inteligência predominante identificada.';

    final topIntelligence = scores.first;
    final secondIntelligence = scores.length > 1 ? scores[1] : null;
    final thirdIntelligence = scores.length > 2 ? scores[2] : null;

    final topName = _getIntelligenceName(topIntelligence.key);
    final topDescription = _getIntelligenceDescription(topIntelligence.key);

    String summary = 'Sua inteligência predominante é **$topName** (${topIntelligence.value}%), ';
    
    if (secondIntelligence != null && thirdIntelligence != null) {
      final secondName = _getIntelligenceName(secondIntelligence.key);
      final thirdName = _getIntelligenceName(thirdIntelligence.key);
      summary += 'seguida por **$secondName** (${secondIntelligence.value}%) e **$thirdName** (${thirdIntelligence.value}%).\n\n';
    } else if (secondIntelligence != null) {
      final secondName = _getIntelligenceName(secondIntelligence.key);
      summary += 'seguida por **$secondName** (${secondIntelligence.value}%).\n\n';
    } else {
      summary += 'demonstrando um perfil bastante específico.\n\n';
    }

    summary += '$topDescription\n\n';
    
    // Adicionar recomendações baseadas nas top inteligências
    summary += '**Carreiras recomendadas:** ${_getIntelligenceCareers(topIntelligence.key)}';
    
    if (secondIntelligence != null) {
      summary += ', ${_getIntelligenceCareers(secondIntelligence.key)}';
    }
    
    summary += '.';

    return summary;
  }

  // Nomes das inteligências
  static String _getIntelligenceName(String intelligence) {
    final names = {
      'linguistic': 'Linguística',
      'logical_mathematical': 'Lógico-Matemática',
      'spatial': 'Espacial',
      'bodily_kinesthetic': 'Corporal-Cinestésica',
      'musical': 'Musical',
      'interpersonal': 'Interpessoal',
      'intrapersonal': 'Intrapessoal',
      'naturalist': 'Naturalista',
    };
    return names[intelligence] ?? intelligence;
  }

  // Descrições das inteligências
  static String _getIntelligenceDescription(String intelligence) {
    final descriptions = {
      'linguistic':
          'Você tem facilidade com palavras, seja para escrever, falar ou interpretar textos. Sua inteligência linguística é marcante - você se expressa com clareza e consegue usar a linguagem para persuadir, informar ou entreter.',
      'logical_mathematical':
          'Você é daquelas pessoas que gosta de números, lógica e raciocínio abstrato. Sua inteligência lógico-matemática é bem desenvolvida - você consegue identificar padrões, resolver problemas complexos e trabalhar com conceitos matemáticos com facilidade.',
      'spatial':
          'É uma daquelas pessoas com significativa capacidade de enxergar o mundo e transformar graficamente as suas cores, linhas, conceitos e ideias? Então a sua inteligência é identificada como espacial. Isso significa que tem sentimentos ligados diretamente à criatividade e estética.',
      'bodily_kinesthetic':
          'Você tem uma boa coordenação motora e gosta de aprender através do movimento e do toque. Sua inteligência corporal-cinestésica é evidente - você se expressa bem através do corpo e tem habilidade para atividades manuais e esportivas.',
      'musical':
          'Você é sensível a sons, ritmos e melodias? Sua inteligência musical permite que você perceba, discrimine e crie música com facilidade.',
      'interpersonal':
          'Você consegue entender as emoções, intenções e desejos dos outros? Sua inteligência interpessoal é bem desenvolvida - você tem facilidade em se relacionar e trabalhar em grupo, e é capaz de criar empatia com as pessoas.',
      'intrapersonal':
          'Você tem um profundo conhecimento de si mesmo, compreendendo suas próprias emoções, medos e motivações? Sua inteligência intrapessoal é marcante - você é autodisciplinado, autoconsciente e consegue planejar sua vida com clareza.',
      'naturalist':
          'Você é sensível à natureza e consegue perceber padrões e relações no ambiente natural? Sua inteligência naturalista permite que você entenda e classifique elementos da natureza.',
    };
    return descriptions[intelligence] ?? '';
  }

  // Carreiras relacionadas
  static String _getIntelligenceCareers(String intelligence) {
    final careers = {
      'linguistic':
          'Jornalistas, escritores, advogados, professores, tradutores, poetas, editores, locutores',
      'logical_mathematical':
          'Engenheiros, matemáticos, físicos, programadores, economistas, contadores, pesquisadores, analistas de dados',
      'spatial':
          'Arquitetos, fotógrafos, designers, cineastas, desenhistas, artistas plásticos, pilotos, navegadores',
      'bodily_kinesthetic':
          'Atletas, dançarinos, cirurgiões, artesãos, atores, educadores físicos, fisioterapeutas, escultores',
      'musical':
          'Músicos, compositores, maestros, DJs, produtores musicais, regentes, críticos musicais, professores de música',
      'interpersonal':
          'Psicólogos, assistentes sociais, vendedores, líderes religiosos, professores, médicos, coaches, políticos',
      'intrapersonal':
          'Filósofos, escritores, terapeutas, líderes espirituais, pesquisadores, psicólogos, consultores, empreendedores',
      'naturalist':
          'Biólogos, geólogos, agricultores, ambientalistas, veterinários, botânicos, oceanógrafos, paisagistas',
    };
    return careers[intelligence] ?? '';
  }

  // =========================
  // PERGUNTAS PADRÃO (32)
  // =========================

  static List<TestQuestion> _getDefaultQuestions() {
    return [
      // INTELIGÊNCIA INTERPESSOAL (4 questões)
      TestQuestion(
        id: '1',
        category: 'interpersonal',
        question:
            'Consigo interpretar as emoções das pessoas mesmo quando elas não falam diretamente sobre o que sentem.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '8',
        category: 'interpersonal',
        question:
            'Trabalho bem em grupo e costumo ajudar a unir as pessoas ao meu redor.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '16',
        category: 'interpersonal',
        question:
            'Tenho facilidade em compreender o ponto de vista de outras pessoas.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '32',
        category: 'interpersonal',
        question:
            'Me adapto bem a diferentes grupos sociais e sei como interagir com cada um deles.',
        options: _getResponseOptions(),
      ),

      // INTELIGÊNCIA NATURALISTA (4 questões)
      TestQuestion(
        id: '2',
        category: 'naturalist',
        question:
            'Tenho facilidade em aprender observando a natureza e como as coisas se relacionam.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '10',
        category: 'naturalist',
        question:
            'Sinto curiosidade em observar plantas, animais ou fenômenos naturais.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '18',
        category: 'naturalist',
        question: 'Me interesso por entender como os ecossistemas funcionam.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '26',
        category: 'naturalist',
        question:
            'Analiso fenômenos naturais com curiosidade e vontade de entender mais.',
        options: _getResponseOptions(),
      ),

      // INTELIGÊNCIA ESPACIAL (4 questões)
      TestQuestion(
        id: '3',
        category: 'spatial',
        question:
            'Gosto de visualizar ambientes, mapas ou espaços e consigo me localizar facilmente.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '11',
        category: 'spatial',
        question:
            'Consigo imaginar cenas e objetos com detalhes apenas usando a mente.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '19',
        category: 'spatial',
        question:
            'Tenho boa noção de direção e consigo lembrar facilmente de trajetos.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '27',
        category: 'spatial',
        question:
            'Gosto de criar desenhos, maquetes ou planejar visualmente projetos.',
        options: _getResponseOptions(),
      ),

      // INTELIGÊNCIA LÓGICO-MATEMÁTICA (4 questões)
      TestQuestion(
        id: '4',
        category: 'logical_mathematical',
        question:
            'Resolver problemas matemáticos ou lógicos é algo que considero natural para mim.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '12',
        category: 'logical_mathematical',
        question:
            'Resolver quebra-cabeças, enigmas ou desafios de raciocínio rápido me atrai.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '20',
        category: 'logical_mathematical',
        question:
            'Consigo identificar erros de lógica com rapidez.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '28',
        category: 'logical_mathematical',
        question:
            'Me sinto confortável trabalhando com números e operações matemáticas.',
        options: _getResponseOptions(),
      ),

      // INTELIGÊNCIA LINGUÍSTICA (4 questões)
      TestQuestion(
        id: '5',
        category: 'linguistic',
        question:
            'Expressar ideias usando palavras, textos ou discursos é algo que faço com facilidade.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '13',
        category: 'linguistic',
        question:
            'Escrever ou ler longos textos é algo que faço sem dificuldade.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '21',
        category: 'linguistic',
        question:
            'Gosto de contar histórias, conversar e explicar ideias verbalmente.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '29',
        category: 'linguistic',
        question:
            'Tenho facilidade em construir argumentos e falar de forma persuasiva.',
        options: _getResponseOptions(),
      ),

      // INTELIGÊNCIA MUSICAL (4 questões)
      TestQuestion(
        id: '6',
        category: 'musical',
        question:
            'Lidar com música, ritmo ou melodia é algo que desperta muito meu interesse.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '14',
        category: 'musical',
        question:
            'Sinto facilidade em perceber padrões musicais e ritmos.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '22',
        category: 'musical',
        question:
            'Quando ouço música, percebo detalhes que outras pessoas às vezes não notam.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '30',
        category: 'musical',
        question:
            'Música me ajuda a pensar, memorizar ou me concentrar.',
        options: _getResponseOptions(),
      ),

      // INTELIGÊNCIA INTRAPESSOAL (4 questões)
      TestQuestion(
        id: '7',
        category: 'intrapersonal',
        question:
            'Entendo bem minhas emoções e sei lidar com elas de forma equilibrada.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '15',
        category: 'intrapersonal',
        question:
            'Frequentemente reflito sobre meu comportamento e procuro me entender melhor.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '23',
        category: 'intrapersonal',
        question:
            'Gosto de estabelecer metas pessoais e avaliar meu próprio progresso.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '31',
        category: 'intrapersonal',
        question:
            'Entender meus limites, medos e motivações é algo importante para mim.',
        options: _getResponseOptions(),
      ),

      // INTELIGÊNCIA CORPORAL-CINESTÉSICA (4 questões)
      TestQuestion(
        id: '9',
        category: 'bodily_kinesthetic',
        question:
            'Tenho interesse em atividades que envolvem movimento corporal, como esportes ou dança.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '17',
        category: 'bodily_kinesthetic',
        question:
            'Gosto de aprender fazendo, mexendo e experimentando fisicamente.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '25',
        category: 'bodily_kinesthetic',
        question:
            'Me sinto motivado em atividades que exigem coordenação e habilidades motoras.',
        options: _getResponseOptions(),
      ),
      TestQuestion(
        id: '24', // Questão adicional para completar 4
        category: 'bodily_kinesthetic',
        question:
            'Tenho habilidade em atividades manuais, como montagem, construção ou artesanato.',
        options: _getResponseOptions(),
      ),
    ];
  }

  // Opções de resposta padronizadas
  static List<TestOption> _getResponseOptions() {
    return [
      TestOption(
        id: '0',
        text: 'Não concordo',
        areaScores: {}, // Não usado no novo cálculo
      ),
      TestOption(
        id: '1',
        text: 'Concordo parcialmente',
        areaScores: {},
      ),
      TestOption(
        id: '2',
        text: 'Neutro',
        areaScores: {},
      ),
      TestOption(
        id: '3',
        text: 'Concordo',
        areaScores: {},
      ),
      TestOption(
        id: '4',
        text: 'Concordo plenamente',
        areaScores: {},
      ),
    ];
  }
}
