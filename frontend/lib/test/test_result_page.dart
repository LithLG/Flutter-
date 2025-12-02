import 'package:flutter/material.dart';
import '../models/test_result.dart';
import '../services/auth_service.dart';
import '../services/test_service.dart';
import '../auth/login_dialog.dart';
import 'test_history_page.dart';
import 'test_questions_page.dart';
import '../theme/app_colors.dart';

class TestResultPage extends StatelessWidget {
  final TestResult result;
  final bool isDarkMode;
  final bool isTemporary;

  const TestResultPage({
    required this.result,
    required this.isDarkMode,
    required this.isTemporary,
  });

  Color _getBackgroundColor() =>
      isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color _getTextColor() =>
      isDarkMode ? AppColors.darkText : AppColors.lightText;
  Color _getCardColor() =>
      isDarkMode ? AppColors.darkCard : AppColors.lightCard;

  void _showLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => LoginDialog(
        isDarkMode: isDarkMode,
        onAuthSuccess: (success) async {
          if (success) {
            Navigator.of(dialogContext).pop();
            final user = await AuthService.getUser();
            if (user != null) {
              await TestService.migrateTemporaryResult(user.id);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Resultado salvo no seu histórico!'),
                  backgroundColor: Colors.green,
                ),
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => TestResultPage(
                    result: result,
                    isDarkMode: isDarkMode,
                    isTemporary: false,
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }

  // CORES
  Color _getIntelligenceColor(String intelligence) {
    final colors = {
      'linguistic': Colors.blue,
      'logical_mathematical': Colors.green,
      'spatial': Colors.purple,
      'bodily_kinesthetic': Colors.orange,
      'musical': Colors.red,
      'interpersonal': Colors.teal,
      'intrapersonal': Colors.pink,
      'naturalist': Colors.lightGreen,
    };
    return colors[intelligence] ?? Colors.grey;
  }

  // NOMES
  String _getIntelligenceName(String intelligence) {
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

  // NOVA FUNÇÃO → DESCRIÇÃO + CURSOS
  Map<String, dynamic> _getIntelligenceContent(String intelligence) {
    final descriptions = {
      'linguistic': {
        'text':
            'A inteligência linguística envolve sensibilidade para a linguagem, domínio do vocabulário, capacidade de estruturar discursos e facilidade para interpretar textos. Está associada à comunicação clara, ao pensamento crítico e à habilidade de expressar ideias de maneira precisa. Engloba competências relacionadas à escrita, leitura, argumentação, contação de histórias e interpretação de nuances linguísticas.',
        'courses': [
          'Jornalismo',
          'Letras',
          'Direito',
          'Publicidade',
          'Relações Públicas',
          'Tradução',
          'Editoração',
          'Locução'
        ]
      },

      'logical_mathematical': {
        'text':
            'A inteligência lógico-matemática é caracterizada pela facilidade em analisar padrões, raciocinar de forma abstrata, resolver problemas de maneira estruturada e compreender relações de causa e efeito. Envolve pensamento analítico, capacidade de lidar com números, lógica avançada e habilidade para interpretar informações e dados de forma objetiva.',
        'courses': [
          'Engenharia',
          'Ciência da Computação',
          'Matemática',
          'Física',
          'Economia',
          'Contabilidade',
          'Estatística',
          'Arquitetura'
        ]
      },

      'spatial': {
        'text':
            'A inteligência espacial está relacionada à percepção visual aguçada, à capacidade de interpretar formas, volumes, proporções e à facilidade de imaginar estruturas no espaço. Inclui competências ligadas ao design, à criatividade visual, ao planejamento estético e à representação gráfica de ideias, seja no ambiente físico ou digital.',
        'courses': [
          'Design Gráfico',
          'Arquitetura',
          'Urbanismo',
          'Cinema',
          'Fotografia',
          'Design de Interiores',
          'Artes Visuais',
          'Moda'
        ]
      },

      'bodily_kinesthetic': {
        'text':
            'A inteligência corporal-cinestésica compreende habilidades relacionadas ao movimento, coordenação motora, controle corporal e domínio das capacidades físicas. Envolve facilidade em aprender por meio da ação, da prática e da expressão corporal, além de sensibilidade tátil e precisão em atividades que exigem destreza ou consciência corporal.',
        'courses': [
          'Educação Física',
          'Fisioterapia',
          'Dança',
          'Teatro',
          'Medicina',
          'Enfermagem',
          'Gastronomia',
          'Educação Artística'
        ]
      },

      'musical': {
        'text':
            'A inteligência musical envolve percepção apurada de ritmo, melodia e harmonia, além da capacidade de reconhecer padrões sonoros complexos. Relaciona-se à criatividade musical, sensibilidade auditiva, memória sonora e compreensão de estruturas musicais, desde arranjos até composições.',
        'courses': [
          'Música',
          'Composição',
          'Produção Musical',
          'Sonoplastia',
          'Musicoterapia',
          'Regência',
          'Engenharia de Som',
          'Artes Cênicas'
        ]
      },

      'interpersonal': {
        'text':
            'A inteligência interpessoal é centrada na compreensão do comportamento humano e do funcionamento social. Ela envolve a capacidade de perceber emoções, intenções e necessidades de outras pessoas, interpretar linguagem corporal, construir relações, colaborar em grupo e atuar como mediador. É uma inteligência voltada completamente para o “mundo externo”: compreender como os outros pensam, sentem e reagem. Está associada à empatia, ao diálogo, à negociação e à facilidade de se adaptar a diferentes perfis e contextos sociais.',
        'courses': [
          'Psicologia',
          'Pedagogia',
          'Serviço Social',
          'Recursos Humanos',
          'Marketing',
          'Administração',
          'Medicina',
          'Enfermagem'
        ]
      },

      'intrapersonal': {
        'text':
            'A inteligência intrapessoal é focada no universo interno e no entendimento profundo de si mesmo. Envolve a habilidade de reconhecer emoções pessoais, identificar motivações, compreender valores individuais, refletir sobre experiências e agir com consciência sobre quem se é e para onde se quer ir. Trata-se de uma inteligência orientada ao “mundo interno”: autopercepção, autorreflexão, clareza emocional e capacidade de analisar pensamentos de forma independente. Está relacionada à maturidade emocional, ao autoconhecimento e à construção de decisões alinhadas à própria identidade.',
        'courses': [
          'Psicologia',
          'Filosofia',
          'Teologia',
          'Coaching',
          'Psicopedagogia',
          'Pesquisa',
          'Escrita Criativa',
          'Consultoria'
        ]
      },

      'naturalist': {
        'text':
            'A inteligência naturalista envolve sensibilidade para elementos da natureza, compreensão de ecossistemas, análise de fenômenos naturais e identificação de padrões ambientais. Engloba interesse por seres vivos, processos biológicos, equilíbrio ecológico e observação detalhada do ambiente natural.',
        'courses': [
          'Biologia',
          'Medicina Veterinária',
          'Agronomia',
          'Geologia',
          'Oceanografia',
          'Ecologia',
          'Farmácia',
          'Educação Ambiental'
        ]
      },
    };

    return descriptions[intelligence] ?? {};
  }

  // WIDGET DAS INTELIGÊNCIAS
  Widget _buildIntelligenceScore(
      BuildContext context, String intelligence, int percentage) {
    final data = _getIntelligenceContent(intelligence);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TÍTULO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _getIntelligenceName(intelligence),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _getTextColor(),
                ),
              ),
              Text(
                '$percentage%',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: _getIntelligenceColor(intelligence),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // BARRA
          Container(
            width: double.infinity,
            height: 12,
            decoration: BoxDecoration(
              color: _getBackgroundColor(),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Stack(
              children: [
                Container(
                  width: (percentage / 100) *
                      MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        _getIntelligenceColor(intelligence),
                        _getIntelligenceColor(intelligence).withOpacity(0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // 🔥 DESCRIÇÃO + CURSOS (AGORA FORMATADOS)
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: TextStyle(
                color: _getTextColor().withOpacity(0.85),
                fontSize: 14,
                height: 1.35,
              ),
              children: [
                TextSpan(text: data['text'] + '\n\n'),

                const TextSpan(
                  text: 'Cursos relacionados:\n',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                ...data['courses'].map<TextSpan>((c) {
                  return TextSpan(
                    text: '• $c\n',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sortedIntelligences = result.areaScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    final topThreeIntelligences = sortedIntelligences.take(3).toList();

    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      appBar: AppBar(
        title: Text(
          'Resultado das Inteligências',
          style: TextStyle(color: _getTextColor()),
        ),
        backgroundColor: _getBackgroundColor(),
        elevation: 0,
        actions: [
          if (!isTemporary)
            IconButton(
              icon: Icon(Icons.history, color: _getTextColor()),
              onPressed: () async {
                final user = await AuthService.getUser();
                if (user != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestHistoryPage(
                        userId: user.id,
                        isDarkMode: isDarkMode,
                      ),
                    ),
                  );
                }
              },
            ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // BANNER LOGIN
            if (isTemporary) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.orange, Colors.deepOrange],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.celebration, size: 40, color: Colors.white),
                    const SizedBox(height: 12),
                    const Text(
                      'Já temos o resultado do seu teste! 🎉',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Faça login para salvar este resultado no seu histórico!',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => _showLoginDialog(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepOrange,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Fazer Login/Cadastro',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // CABEÇALHO
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [AppColors.primary, AppColors.secondary],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        isTemporary ? Icons.psychology : Icons.emoji_events,
                        size: 60,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        isTemporary ? 'Teste Concluído!' : 'Parabéns!',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        isTemporary
                            ? 'Veja suas áreas de afinidade abaixo'
                            : 'Teste salvo no seu histórico',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // TOP 3
            Text(
              '🎯 Suas Principais Inteligências',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: _getTextColor(),
              ),
            ),
            const SizedBox(height: 16),

            ...topThreeIntelligences.asMap().entries.map((entry) {
              final index = entry.key;
              final intelligence = entry.value;
              final icons = [Icons.emoji_events, Icons.star, Icons.thumb_up];
              final colors = [Colors.amber, Colors.blue, Colors.green];

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _getCardColor(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: colors[index].withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icons[index], color: colors[index]),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        '${index + 1}º Lugar - ${_getIntelligenceName(intelligence.key)}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _getTextColor(),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 32),

            // TODAS AS INTELIGÊNCIAS
            Text(
              '📊 Todas as Inteligências',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: _getTextColor(),
              ),
            ),
            const SizedBox(height: 16),

            ...sortedIntelligences.map((intelligence) {
              return _buildIntelligenceScore(
                context,
                intelligence.key,
                intelligence.value,
              );
            }).toList(),

            const SizedBox(height: 32),

            // RESUMO FINAL
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _getCardColor(),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.primary.withOpacity(0.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💡 Resumo do Seu Perfil',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: _getTextColor(),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    result.summary,
                    style: TextStyle(
                      color: _getTextColor().withOpacity(0.8),
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // AÇÕES
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.popUntil(
                        context, (route) => route.isFirst),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _getTextColor(),
                      side: BorderSide(color: _getTextColor()),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Voltar ao Início'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TestQuestionsPage(isDarkMode: isDarkMode),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text('Fazer Novo Teste'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
