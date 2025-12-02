const TestResult = require('../models/TestResult');

const getQuestions = async (req, res) => {
  try {
    console.log('📥 Buscando perguntas do teste de inteligências múltiplas');
    
    const defaultOptions = [
      { id: '0', text: 'Discordo', areaScores: {} },
      { id: '1', text: 'Discordo parcialmente', areaScores: {} },
      { id: '2', text: 'Neutro', areaScores: {} },
      { id: '3', text: 'Concordo parcialmente', areaScores: {} },
      { id: '4', text: 'Concordo', areaScores: {} }
    ];

    const questions = [

      // INTERPESSOAL
      { id: '1',  category: 'interpersonal', question: 'Consigo interpretar as emoções das pessoas mesmo quando elas não falam diretamente sobre o que sentem.', options: defaultOptions },
      { id: '8',  category: 'interpersonal', question: 'Trabalho bem em grupo e costumo ajudar a unir as pessoas ao meu redor.', options: defaultOptions },
      { id: '16', category: 'interpersonal', question: 'Tenho facilidade em compreender o ponto de vista de outras pessoas.', options: defaultOptions },
      { id: '32', category: 'interpersonal', question: 'Me adapto bem a diferentes grupos sociais e sei como interagir com cada um deles.', options: defaultOptions },

      // NATURALISTA
      { id: '2',  category: 'naturalist', question: 'Tenho facilidade em aprender observando a natureza e como as coisas se relacionam.', options: defaultOptions },
      { id: '10', category: 'naturalist', question: 'Sinto curiosidade em observar plantas, animais ou fenômenos naturais.', options: defaultOptions },
      { id: '18', category: 'naturalist', question: 'Me interesso por entender como os ecossistemas funcionam.', options: defaultOptions },
      { id: '26', category: 'naturalist', question: 'Analiso fenômenos naturais com curiosidade e vontade de entender mais.', options: defaultOptions },

      // ESPACIAL
      { id: '3',  category: 'spatial', question: 'Gosto de visualizar ambientes, mapas ou espaços e consigo me localizar facilmente.', options: defaultOptions },
      { id: '11', category: 'spatial', question: 'Consigo imaginar cenas e objetos com detalhes apenas usando a mente.', options: defaultOptions },
      { id: '19', category: 'spatial', question: 'Tenho boa noção de direção e consigo lembrar facilmente de trajetos.', options: defaultOptions },
      { id: '27', category: 'spatial', question: 'Gosto de criar desenhos, maquetes ou planejar visualmente projetos.', options: defaultOptions },

      // LÓGICO-MATEMÁTICA
      { id: '4',  category: 'logical_mathematical', question: 'Resolver problemas matemáticos ou lógicos é algo que considero natural para mim.', options: defaultOptions },
      { id: '12', category: 'logical_mathematical', question: 'Resolver quebra-cabeças, enigmas ou desafios de raciocínio rápido me atrai.', options: defaultOptions },
      { id: '20', category: 'logical_mathematical', question: 'Consigo identificar erros de lógica com rapidez.', options: defaultOptions },
      { id: '28', category: 'logical_mathematical', question: 'Me sinto confortável trabalhando com números e operações matemáticas.', options: defaultOptions },

      // LINGUÍSTICA
      { id: '5',  category: 'linguistic', question: 'Expressar ideias usando palavras, textos ou discursos é algo que faço com facilidade.', options: defaultOptions },
      { id: '13', category: 'linguistic', question: 'Escrever ou ler longos textos é algo que faço sem dificuldade.', options: defaultOptions },
      { id: '21', category: 'linguistic', question: 'Gosto de contar histórias, conversar e explicar ideias verbalmente.', options: defaultOptions },
      { id: '29', category: 'linguistic', question: 'Tenho facilidade em construir argumentos e falar de forma persuasiva.', options: defaultOptions },

      // MUSICAL
      { id: '6',  category: 'musical', question: 'Lidar com música, ritmo ou melodia é algo que desperta muito meu interesse.', options: defaultOptions },
      { id: '14', category: 'musical', question: 'Sinto facilidade em perceber padrões musicais e ritmos.', options: defaultOptions },
      { id: '22', category: 'musical', question: 'Quando ouço música, percebo detalhes que outras pessoas às vezes não notam.', options: defaultOptions },
      { id: '30', category: 'musical', question: 'Música me ajuda a pensar, memorizar ou me concentrar.', options: defaultOptions },

      // INTRAPESSOAL
      { id: '7',  category: 'intrapersonal', question: 'Entendo bem minhas emoções e sei lidar com elas de forma equilibrada.', options: defaultOptions },
      { id: '15', category: 'intrapersonal', question: 'Frequentemente reflito sobre meu comportamento e procuro me entender melhor.', options: defaultOptions },
      { id: '23', category: 'intrapersonal', question: 'Gosto de estabelecer metas pessoais e avaliar meu próprio progresso.', options: defaultOptions },
      { id: '31', category: 'intrapersonal', question: 'Entender meus limites, medos e motivações é algo importante para mim.', options: defaultOptions },

      // CORPORAL-CINESTÉSICA
      { id: '9',  category: 'bodily_kinesthetic', question: 'Tenho interesse em atividades que envolvem movimento corporal, como esportes ou dança.', options: defaultOptions },
      { id: '17', category: 'bodily_kinesthetic', question: 'Gosto de aprender fazendo, mexendo e experimentando fisicamente.', options: defaultOptions },
      { id: '25', category: 'bodily_kinesthetic', question: 'Me sinto motivado em atividades que exigem coordenação e habilidades motoras.', options: defaultOptions },
      { id: '24', category: 'bodily_kinesthetic', question: 'Tenho habilidade em atividades manuais, como montagem, construção ou artesanato.', options: defaultOptions },
    ];
    
    console.log(`✅ Retornando ${questions.length} perguntas das inteligências múltiplas`);
    res.json({ success: true, questions });

  } catch (error) {
    console.error('❌ Erro ao carregar perguntas:', error);
    res.status(500).json({ 
      success: false, 
      message: 'Erro ao carregar perguntas' 
    });
  }
};

const saveTestResult = async (req, res) => {
  try {
    console.log('📥 Recebendo resultado do teste:', req.body);
    
    const { id, completedAt, areaScores, topAreas, responses, summary } = req.body;
    const userId = req.user._id;
    
    // Converter areaScores para Map (necessário para o schema)
    const areaScoresMap = new Map(Object.entries(areaScores));
    
    // Criar novo resultado
    const testResult = new TestResult({
      id,
      userId,
      completedAt: new Date(completedAt),
      areaScores: areaScoresMap,
      topAreas,
      responses,
      summary,
    });
    
    await testResult.save();
    console.log('✅ Resultado salvo no MongoDB com ID:', testResult._id);
    
    res.status(201).json({ 
      success: true, 
      message: 'Resultado salvo com sucesso',
      resultId: testResult._id 
    });
  } catch (error) {
    console.error('❌ Erro ao salvar resultado:', error);
    
    if (error.name === 'ValidationError') {
      const errors = Object.values(error.errors).map(err => err.message);
      return res.status(400).json({
        success: false,
        message: 'Dados inválidos',
        errors
      });
    }
    
    if (error.code === 11000) {
      return res.status(400).json({
        success: false,
        message: 'Resultado duplicado'
      });
    }
    
    res.status(500).json({ 
      success: false, 
      message: 'Erro ao salvar resultado no banco de dados' 
    });
  }
};

const getUserResults = async (req, res) => {
  try {
    const userId = req.user._id;
    
    console.log('📥 Buscando resultados para usuário:', userId);
    
    const results = await TestResult.find({ userId }).sort({ completedAt: -1 });
    console.log(`✅ Encontrados ${results.length} resultados para o usuário ${userId}`);
    
    // Converter Map para Object para resposta JSON
    const formattedResults = results.map(result => ({
      id: result.id,
      userId: result.userId,
      completedAt: result.completedAt,
      areaScores: Object.fromEntries(result.areaScores),
      topAreas: result.topAreas,
      responses: result.responses,
      summary: result.summary,
      createdAt: result.createdAt
    }));
    
    res.json({ 
      success: true, 
      results: formattedResults
    });
  } catch (error) {
    console.error('❌ Erro ao buscar resultados:', error);
    res.status(500).json({ 
      success: false, 
      message: 'Erro ao carregar resultados' 
    });
  }
};

module.exports = {
  getQuestions,
  saveTestResult,
  getUserResults
};