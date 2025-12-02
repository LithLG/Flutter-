import 'package:flutter/material.dart';
import '../auth/login_dialog.dart';
import '../theme/app_colors.dart';
import 'widgets/login_button.dart';
import 'widgets/feature_card.dart';
import 'widgets/drawer_item.dart';
import '../services/auth_service.dart';
import '../models/user.dart';
import '../courses/courses_page.dart';
import '../universities/universities_map_page.dart';

// 🔥 IMPORTS ADICIONADOS PARA O TESTE VOCACIONAL
import '../services/test_service.dart';
import '../test/test_intro_page.dart';
import '../test/test_result_page.dart';
import '../test/test_history_page.dart';

class HomePage extends StatefulWidget {
  final User? initialUser;

  const HomePage({this.initialUser});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isDarkMode = false;
  bool _isLoggedIn = false;
  User? _currentUser;
  bool _isLoading = true;

  // 🔥 AGORA USANDO UMA LISTA SIMPLES E CONTROLE SEPARADO PARA O ACCORDION
  final List<Map<String, String>> _intelligences = [
    {
      'title': '🤔 Inteligência Linguística',
      'description':
          'Capacidade de perceber, organizar e manipular a linguagem falada e escrita com clareza, precisão e criatividade. Envolve facilidade para escolher palavras adequadas em diferentes contextos, construir frases coerentes, contar histórias, argumentar, explicar ideias complexas de forma simples e adaptar o modo de falar ou escrever ao público. Inclui também sensibilidade para nuances de sentido, metáforas, humor, entonação, ritmo da fala, jogos de palavras e múltiplos significados. Essa inteligência é muito valorizada em contextos que exigem comunicação, como redação de textos, debates, apresentações, produção de conteúdo, ensino e aprendizado de idiomas.',
    },
    {
      'title': '🔢 Inteligência Lógico-Matemática',
      'description':
          'Capacidade de raciocinar de forma estruturada, identificar padrões, relações de causa e efeito e resolver problemas por meio de análises lógicas e quantitativas. Envolve lidar bem com números, fórmulas, classificações, sequências, hipóteses e testes de ideias. Também abrange a habilidade de criar modelos, organizar informações em categorias, estabelecer comparações e tirar conclusões consistentes a partir de dados. Essa inteligência é muito utilizada em situações que envolvem planejamento, estratégia, programação, experimentos, tomada de decisão baseada em evidências, além de áreas como matemática, ciências, tecnologia e finanças.',
    },
    {
      'title': '🎨 Inteligência Espacial',
      'description':
          'Capacidade de perceber, representar e manipular mentalmente formas, tamanhos, distâncias e relações entre objetos no espaço. Inclui imaginar objetos em diferentes ângulos, visualizar ambientes em três dimensões, entender mapas, plantas, diagramas e criar imagens mentais detalhadas. Essa inteligência permite planejar caminhos, organizar visualmente informações, ter senso de proporção, equilíbrio e composição, além de compreender facilmente gráficos, desenhos técnicos e ilustrações. É muito importante em atividades que envolvem design, arquitetura, artes visuais, engenharia, navegação, jogos e resolução de problemas que dependem de orientação espacial.',
    },
    {
      'title': '💃 Inteligência Corporal-Cinestésica',
      'description':
          'Capacidade de usar o corpo de forma coordenada, precisa e expressiva, tanto em movimentos amplos quanto em movimentos finos e delicados. Envolve consciência corporal (saber onde cada parte do corpo está e como se movimenta), controle motor, equilíbrio, agilidade, ritmo, tempo de reação e noção de esforço e força. Também está ligada à habilidade de aprender fazendo, por meio de experiências práticas, experimentação manual e manipulação de objetos. Essa inteligência aparece em contextos como esportes, dança, teatro, artes marciais, trabalhos manuais, cirurgias, trabalhos técnicos e qualquer atividade que exija “mão na massa” e domínio do próprio corpo.',
    },
    {
      'title': '🎵 Inteligência Musical',
      'description':
          'Capacidade de perceber, compreender e organizar sons de maneira significativa. Inclui sensibilidade para ritmo, melodia, harmonia, timbre, altura das notas, pausas e variações de intensidade. Envolve reconhecer padrões musicais, identificar quando algo está “fora do tom”, criar ou reproduzir sequências sonoras, memorizar melodias e perceber como a música afeta emoções e ambientes. Também pode englobar improvisação, composição, arranjo e facilidade em aprender instrumentos ou linhas vocais. Essa inteligência é muito presente em atividades como canto, performance musical, produção de áudio, trilhas sonoras, regência, edição de som e até na forma como as pessoas utilizam música para se concentrar, relaxar ou se expressar.',
    },
    {
      'title': '👥 Inteligência Interpessoal',
      'description':
          'Capacidade de compreender outras pessoas, percebendo emoções, necessidades, intenções e maneiras de pensar diferentes das próprias. Envolve empatia, escuta ativa, leitura de expressões faciais, linguagem corporal e tom de voz, além de sensibilidade para o clima emocional de um grupo. Essa inteligência facilita a comunicação clara, a colaboração, a negociação, a mediação de conflitos e a construção de relacionamentos saudáveis. Também está ligada à habilidade de motivar, orientar, explicar algo de forma que faça sentido para o outro e adaptar a comunicação ao perfil de cada pessoa. Enquanto a inteligência intrapessoal foca em entender a si mesmo, a inteligência interpessoal foca principalmente em entender e se relacionar com os outros.',
    },
    {
      'title': '🧘 Inteligência Intrapessoal',
      'description':
          'Capacidade de compreender a si mesmo em profundidade: perceber emoções, pensamentos, valores, motivações, limites, medos e desejos pessoais. Envolve auto-observação, reflexão, clareza sobre o que faz sentido para a própria vida e consciência de como experiências passadas influenciam o presente. Também está relacionada à habilidade de reconhecer o próprio estado emocional, nomear o que se sente, identificar gatilhos internos, regular emoções e tomar decisões alinhadas com objetivos e princípios pessoais. Essa inteligência ajuda na definição de metas, planejamento de vida, autocuidado e desenvolvimento pessoal. Enquanto a inteligência interpessoal se volta para entender os outros, a inteligência intrapessoal se concentra em olhar para dentro e construir um bom relacionamento consigo mesmo.',
    },
    {
      'title': '🌿 Inteligência Naturalista',
      'description':
          'Capacidade de observar, reconhecer, diferenciar e organizar elementos do mundo natural, como plantas, animais, minerais, fenômenos climáticos e paisagens. Envolve perceber detalhes sutis na natureza, identificar padrões em ciclos naturais (como estações do ano, comportamento de animais, características de ambientes) e classificar organismos ou recursos de acordo com suas semelhanças e diferenças. Essa inteligência também está ligada ao interesse por ecossistemas, sustentabilidade, cuidado com o meio ambiente, cultivo de alimentos, uso de ingredientes naturais e compreensão da interação entre seres vivos e o ambiente. É muito relevante em contextos como biologia, agronomia, ecologia, nutrição, gastronomia, atividades ao ar livre e projetos que envolvem respeito e preservação da natureza.',
    },
  ];


  // 🔥 CONTROLE DE ESTADO PARA O ACCORDION
  List<bool> _isExpandedList = [];

  @override
  void initState() {
    super.initState();
    
    // 🔥 INICIALIZA A LISTA DE EXPANSÃO
    _isExpandedList = List.generate(_intelligences.length, (index) => false);
    
    if (widget.initialUser != null) {
      _currentUser = widget.initialUser;
      _isLoggedIn = true;
      _isLoading = false;
      print('✅ [HomePage] Usuário inicial definido: ${_currentUser?.email}');
    } else {
      _initializeApp();
    }
    
    _checkForTemporaryResult();
  }
  
  void _checkForTemporaryResult() async {
    final temporaryResult = await TestService.getTemporaryResult();
    if (temporaryResult != null && mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.psychology, color: Colors.white),
                SizedBox(width: 8),
                Expanded(
                  child: Text('Você tem um teste não salvo. Faça login para salvá-lo!'),
                ),
              ],
            ),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Ver Resultado',
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestResultPage(
                      result: temporaryResult,
                      isDarkMode: _isDarkMode,
                      isTemporary: true,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      });
    }
  }

  void _initializeApp() async {
    print('🔄 [HomePage] Verificando autenticação...');
    
    try {
      final loggedIn = await AuthService.isLoggedIn();
      final user = await AuthService.getUser();
      
      print('📊 [HomePage] Status - Logado: $loggedIn, Usuário: ${user?.email}');
      
      setState(() {
        _isLoggedIn = loggedIn;
        _currentUser = user;
        _isLoading = false;
      });
    } catch (e) {
      print('❌ [HomePage] Erro ao verificar auth: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _checkAuthStatus() async {
    try {
      print('🔄 [HomePage] Verificando autenticação...');
      
      final loggedIn = await AuthService.isLoggedIn();
      final user = await AuthService.getUser();
      
      print('📊 [HomePage] Status - Logado: $loggedIn, Usuário: ${user?.email}');
      
      if (mounted) {
        setState(() {
          _isLoggedIn = loggedIn;
          _currentUser = user;
        });
      }
    } catch (e) {
      print('❌ [HomePage] Erro ao verificar auth: $e');
    }
  }

  void _iniciarTeste() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TestIntroPage(isDarkMode: _isDarkMode),
      ),
    );
  }

  void _abrirLogin() {
    print('👆 [HomePage] Abrindo diálogo de login...');
    
    showDialog(
      context: context,
      builder: (context) => LoginDialog(
        isDarkMode: _isDarkMode,
        onAuthSuccess: (success) {
          print('✅ [HomePage] Login bem-sucedido no callback');
          if (success) {
            Future.delayed(Duration(milliseconds: 300), () {
              _checkAuthStatus();
            });
          }
        },
      ),
    ).then((value) {
      print('🔒 [HomePage] Diálogo de login fechado');
      _checkAuthStatus();
    });
  }

  void _scrollToSection(String sectionId) {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _abrirDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    Navigator.pop(context);
  }

  Future<void> _logout() async {
    print('🚪 [HomePage] Fazendo logout...');
    
    await AuthService.logout();
    
    if (mounted) {
      setState(() {
        _isLoggedIn = false;
        _currentUser = null;
      });
    }
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Logout realizado com sucesso!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  Color _getBackgroundColor() => _isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color _getTextColor() => _isDarkMode ? AppColors.darkText : AppColors.lightText;
  Color _getCardColor() => _isDarkMode ? AppColors.darkCard : AppColors.lightCard;
  Color _getGreyTextColor() => _isDarkMode ? AppColors.darkGreyText : AppColors.lightGreyText;

  Widget _buildUserButton(bool isMobile) {
    print('🎯 [HomePage] Construindo botão - Logado: $_isLoggedIn');
    
    if (_isLoggedIn && _currentUser != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: _logout,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 20, vertical: isMobile ? 8 : 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.person, color: Colors.white, size: isMobile ? 18 : 20),
                SizedBox(width: 8),
                Text(
                  _currentUser!.name.split(' ').first,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: isMobile ? 14 : 16,
                  ),
                ),
                SizedBox(width: 4),
                Icon(Icons.logout, color: Colors.white, size: isMobile ? 16 : 18),
              ],
            ),
          ),
        ),
      );
    } else {
      return LoginButton(onTap: _abrirLogin, isMobile: isMobile);
    }
  }

  @override
  Widget build(BuildContext context) {
    print('🏗️ [HomePage] Build executado - Logado: $_isLoggedIn');
    
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    if (_isLoading) {
      return Scaffold(
        backgroundColor: _getBackgroundColor(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text(
                'Carregando...',
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: _getBackgroundColor(),
      endDrawer: _buildDrawer(isMobile),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.secondary],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
                  children: [
                    // logo
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8), // arredonda se quiser
                      child: Image.asset(
                        'assets/logo.png',
                        width: isMobile ? 54 : 64,
                        height: isMobile ? 54 : 64,
                        fit: BoxFit.cover,
                        // semanticLabel: 'UniDecide logo', // opcional para acessibilidade
                      ),
                    ),
                    Text(
                      'UniDecide',
                      style: TextStyle(
                        fontSize: isMobile ? 24 : 28,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                  Row(
                    children: [
                      _buildUserButton(isMobile),
                      SizedBox(width: 10),
                      IconButton(
                        icon: Icon(Icons.menu, color: Colors.white, size: isMobile ? 24 : 28),
                        onPressed: _abrirDrawer,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: _buildSliverContent(isMobile),
      ),
    );
  }

  List<Widget> _buildSliverContent(bool isMobile) {
    return [
      _buildHeroSection(isMobile),
      _buildFeaturesSection(isMobile),
      _buildIntelligenceSection(isMobile),
      _buildFooter(),
    ];
  }

SliverToBoxAdapter _buildHeroSection(bool isMobile) {
  return SliverToBoxAdapter(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.secondary,
            Color(0xFF6A11CB),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -50,
            right: -30,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -40,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.05),
              ),
            ),
          ),

// CONTEÚDO PRINCIPAL CENTRALIZADO
Padding(
  padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
  child: Column(
    mainAxisSize: MainAxisSize.min, // usa só o espaço necessário
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // LOGO (fixa)
      Padding(
        padding: EdgeInsets.only(top: 0, bottom: 0),
        child: Image.asset(
          'assets/logo.png',
          width: isMobile ? 280 : 380,
          height: isMobile ? 260 : 360,
          fit: BoxFit.fill,
        ),
      ),

      // AQUI transformamos todo o resto e "subimos" com offset negativo
      Transform.translate(
        offset: Offset(0, isMobile ? -20 : -20), // <- ajuste aqui (negativo = sobe)
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TÍTULO PRINCIPAL (colado na logo)
            Text(
              'Descubra Seu Futuro\nUniversitário',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isMobile ? 36 : 56,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                height: 1.05, // deixa as linhas mais juntas
                letterSpacing: -0.5,
              ),
            ),

            SizedBox(height: isMobile ? 8 : 12), // pequeno espaçamento

            // SUBTÍTULO
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isMobile ? double.infinity : 800),
              child: Text(
                'Encontre a carreira perfeita através do nosso teste vocacional '
                'baseado na teoria das Inteligências Múltiplas de Howard Gardner. '
                'Descubra seus talentos naturais e encontre o curso ideal para seu sucesso profissional.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 18,
                  color: Colors.white.withOpacity(0.9),
                  height: 1.5,
                ),
              ),
            ),

            SizedBox(height: isMobile ? 16 : 28),

            // BOTÃO CENTRAL
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _iniciarTeste,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24 : 40,
                      vertical: isMobile ? 12 : 18,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.3),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.rocket_launch, size: isMobile ? 18 : 22),
                      SizedBox(width: 8),
                      Text(
                        'Começar Teste Vocacional',
                        style: TextStyle(
                          fontSize: isMobile ? 14 : 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: isMobile ? 16 : 28),

            // ESTATÍSTICAS RÁPIDAS
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('32', 'Perguntas Avaliativas', isMobile),
                  _buildStatItem('10-15', 'minutos', isMobile),
                  _buildStatItem('8', 'Áreas Avaliadas', isMobile),
                  if (!isMobile) _buildStatItem('100%', 'Gratuito', isMobile),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  ),
),

        ],
      ),
    ),
  );
}

// 🔥 WIDGET PARA ITENS DE ESTATÍSTICA
Widget _buildStatItem(String number, String text, bool isMobile) {
  return Column(
    children: [
      Text(
        number,
        style: TextStyle(
          fontSize: isMobile ? 20 : 24,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 4),
      Text(
        text,
        style: TextStyle(
          fontSize: isMobile ? 12 : 14,
          color: Colors.white.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}


  SliverToBoxAdapter _buildFeaturesSection(bool isMobile) {
    return SliverToBoxAdapter(
      child: Container(
        color: _getBackgroundColor(),
        padding: EdgeInsets.symmetric(
          vertical: 80, 
          horizontal: isMobile ? 20 : 40,
        ),
        child: Column(
          children: [
            Text(
              'Como Funciona',
              style: TextStyle(
                fontSize: isMobile ? 32 : 40,
                fontWeight: FontWeight.w700,
                color: _getTextColor(),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 40),
              child: Text(
                'Nosso teste vocacional é baseado na teoria das Inteligências Múltiplas de Howard Gardner. Descubra como funciona:',
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: _getGreyTextColor(),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 60),
            isMobile ? _buildMobileFeatures() : _buildDesktopFeatures(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileFeatures() {
    return Column(
      children: [
        FeatureCard(
          icon: '🧠',
          title: 'Avaliação das 8 Inteligências',
          description: 'Nosso teste analisa seu perfil nas 8 áreas de inteligência múltiplas: linguística, lógico-matemática, espacial, corporal-cinestésica, musical, interpessoal, intrapessoal e naturalista',
          isMobile: true,
          backgroundColor: _getCardColor(),
          textColor: _getTextColor(),
          greyTextColor: _getGreyTextColor(),
        ),
        SizedBox(height: 20),
        FeatureCard(
          icon: '🎯',
          title: 'Análise Inteligente',
          description: 'Nosso algoritmo analisa suas respostas e identifica seus pontos fortes e áreas de interesse predominantes',
          isMobile: true,
          backgroundColor: _getCardColor(),
          textColor: _getTextColor(),
          greyTextColor: _getGreyTextColor(),
        ),
        SizedBox(height: 20),
        FeatureCard(
          icon: '📊',
          title: 'Resultados Personalizados',
          description: 'Receba recomendações de cursos e carreiras que combinam com seu perfil único de inteligências múltiplas',
          isMobile: true,
          backgroundColor: _getCardColor(),
          textColor: _getTextColor(),
          greyTextColor: _getGreyTextColor(),
        ),
      ],
    );
  }

  Widget _buildDesktopFeatures() {
    return IntrinsicHeight( // garante que todos usem a mesma altura
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: FeatureCard(
              icon: '🧠',
              title: 'Avaliação das 8 Inteligências',
              description:
                  'Nosso teste analisa seu perfil nas 8 áreas de inteligência múltiplas: linguística, lógico-matemática, espacial, corporal-cinestésica, musical, interpessoal, intrapessoal e naturalista',
              isMobile: false,
              backgroundColor: _getCardColor(),
              textColor: _getTextColor(),
              greyTextColor: _getGreyTextColor(),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: FeatureCard(
              icon: '🎯',
              title: 'Análise Inteligente',
              description:
                  'Nosso algoritmo analisa suas respostas e identifica seus pontos fortes e áreas de interesse predominantes',
              isMobile: false,
              backgroundColor: _getCardColor(),
              textColor: _getTextColor(),
              greyTextColor: _getGreyTextColor(),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: FeatureCard(
              icon: '📊',
              title: 'Resultados Personalizados',
              description:
                  'Receba recomendações de cursos e carreiras que combinam com seu perfil único de inteligências múltiplas',
              isMobile: false,
              backgroundColor: _getCardColor(),
              textColor: _getTextColor(),
              greyTextColor: _getGreyTextColor(),
            ),
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildIntelligenceSection(bool isMobile) {
    return SliverToBoxAdapter(
      child: Container(
        color: _getBackgroundColor(),
        padding: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: isMobile ? 20 : 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'As 8 Inteligências Múltiplas',
                style: TextStyle(
                  fontSize: isMobile ? 32 : 40,
                  fontWeight: FontWeight.w700,
                  color: _getTextColor(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 40),
                child: Text(
                  'Nosso teste é baseado na teoria de Howard Gardner, que identifica 8 tipos diferentes de inteligência. Cada pessoa possui uma combinação única dessas inteligências.',
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    color: _getGreyTextColor(),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 40),
            _buildIntelligenceAccordion(),
          ],
        ),
      ),
    );
  }

  Widget _buildIntelligenceAccordion() {
    return Container(
      decoration: BoxDecoration(
        color: _getCardColor(),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: _getGreyTextColor().withOpacity(0.3),

          // 👇 seta quando não expandida
          unselectedWidgetColor:
              _isDarkMode ? Colors.white : _getTextColor(),

          // 👇 seta quando expandida
          colorScheme: Theme.of(context).colorScheme.copyWith(
                onSurface: _isDarkMode ? Colors.white : _getTextColor(),
              ),
        ),
        child: ExpansionPanelList(
          elevation: 0,
          expandedHeaderPadding: EdgeInsets.zero,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _isExpandedList[index] = !_isExpandedList[index];
            });
          },
          children: _intelligences.asMap().entries.map<ExpansionPanel>((entry) {
            int index = entry.key;
            Map<String, String> intelligence = entry.value;

            return ExpansionPanel(
              canTapOnHeader: true, // 👈 agora o card inteiro expande
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(
                    intelligence['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: _getTextColor(),
                      fontSize: 16,
                    ),
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                  intelligence['description']!,
                  style: TextStyle(
                    color: _getGreyTextColor(),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
              isExpanded: _isExpandedList[index],
              backgroundColor: _getCardColor(),
            );
          }).toList(),
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildFooter() {
    final bool isMobile = MediaQuery.of(context).size.width < 768;

    return SliverToBoxAdapter(
      child: Container(
        color: _isDarkMode ? Color(0xFF1a1a1a) : Color(0xFF2c3e50),
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Text(
          '© 2025 UniDecide. Todos os direitos reservados. Construindo o futuro da educação brasileira.',
          style: TextStyle(
            color: Colors.white,
            fontSize: isMobile ? 14 : 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildDrawer(bool isMobile) {
    return Drawer(
      backgroundColor: _getBackgroundColor(),
      width: isMobile ? MediaQuery.of(context).size.width * 0.8 : 300,
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primary, AppColors.secondary],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🎓 UniDecide',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Menu de Navegação',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: _buildDrawerItems(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'UniDecide © 2025',
              style: TextStyle(
                color: _getGreyTextColor(),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildDrawerItems() {
    return [
      DrawerItem(
        icon: Icons.home,
        text: 'Início',
        onTap: () {
          _scrollToSection('inicio');
          Navigator.pop(context);
        },
        textColor: _getTextColor(),
      ),
      DrawerItem(
        icon: Icons.quiz,
        text: 'Teste Vocacional',
        onTap: () {
          Navigator.pop(context);
          _iniciarTeste();
        },
        textColor: _getTextColor(),
      ),
      DrawerItem(
        icon: Icons.history,
        text: 'Meus Testes',
        onTap: () async {
          Navigator.pop(context);
          final user = await AuthService.getUser();
          if (user != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TestHistoryPage(
                  userId: user.id,
                  isDarkMode: _isDarkMode,
                ),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Faça login para ver seu histórico'),
                backgroundColor: Colors.orange,
              ),
            );
          }
        },
        textColor: _getTextColor(),
      ),
      DrawerItem(
        icon: Icons.school,
        text: 'Cursos',
        onTap: () {
          Navigator.pop(context); // Fecha o drawer
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CoursesPage(
                isDarkMode: _isDarkMode,
                initialSearch: null, // 🔥 ADICIONAR ESTE PARÂMETRO
              ),
            ),
          );
        },
        textColor: _getTextColor(),
      ),
      DrawerItem(
        icon: Icons.account_balance,
        text: 'Universidades',
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UniversitiesMapPage(isDarkMode: _isDarkMode),
            ),
          );
        },
        textColor: _getTextColor(),
      ),
      DrawerItem(
        icon: Icons.contact_support,
        text: 'Contato',
        onTap: () {
          Navigator.pop(context);
          _showContactDialog();
        },
        textColor: _getTextColor(),
      ),
      DrawerItem(
        icon: _isDarkMode ? Icons.light_mode : Icons.dark_mode,
        text: _isDarkMode ? 'Modo Claro' : 'Modo Escuro',
        onTap: _toggleDarkMode,
        textColor: _getTextColor(),
      ),
      Divider(height: 40, color: _getGreyTextColor()),
      DrawerItem(
        icon: Icons.help,
        text: 'Sobre Nós',
        onTap: () {
          Navigator.pop(context);
          _showAboutDialog();
        },
        textColor: _getTextColor(),
      ),
      DrawerItem(
        icon: Icons.privacy_tip,
        text: 'Política de Privacidade',
        onTap: () {
          Navigator.pop(context);
          _showPrivacyDialog();
        },
        textColor: _getTextColor(),
      ),
    ];
  }

  void _showContactDialog() {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: _getCardColor(),
      title: Text(
        'Contato',
        style: TextStyle(color: _getTextColor()),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Entre em contato para dúvidas, sugestões ou suporte técnico.',
            style: TextStyle(
              color: _getGreyTextColor(),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 16),
          Text(
            '📩 Enviar e-mail:\n'
            'lucasgabrielunisal@gmail.com',
            style: TextStyle(
              color: _getGreyTextColor(),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 12),
          Text(
            '💬 Suporte via WhatsApp:\n'
            '(12) 99668-2777',
            style: TextStyle(
              color: _getGreyTextColor(),
              fontSize: 14,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Fechar',
            style: TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    ),
  );
}

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _getCardColor(),
        title: Text('Sobre o UniDecide', style: TextStyle(color: _getTextColor())),
        content: Text(
          'O UniDecide é uma plataforma inovadora que ajuda estudantes a descobrirem seu caminho universitário ideal através de testes vocacionais baseados na teoria das Inteligências Múltiplas de Howard Gardner.',
          style: TextStyle(color: _getGreyTextColor()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Fechar', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  void _showPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _getCardColor(),
        title: Text('Política de Privacidade', style: TextStyle(color: _getTextColor())),
        content: Text(
          'Nós valorizamos sua privacidade. Seus dados estão seguros conosco e nunca serão compartilhados com terceiros sem sua autorização.',
          style: TextStyle(color: _getGreyTextColor()),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Entendi', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}