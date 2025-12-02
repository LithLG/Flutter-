import 'package:flutter/material.dart';
import '../models/test_result.dart';
import '../services/test_service.dart';
import '../theme/app_colors.dart';
import '../courses/courses_page.dart'; // 🔥 ADICIONAR IMPORT

class TestHistoryPage extends StatefulWidget {
  final String userId;
  final bool isDarkMode;

  const TestHistoryPage({
    required this.userId,
    required this.isDarkMode,
  });

  @override
  _TestHistoryPageState createState() => _TestHistoryPageState();
}

class _TestHistoryPageState extends State<TestHistoryPage> {
  List<TestResult> _results = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadResults();
  }

  Future<void> _loadResults() async {
    try {
      print('📥 [TestHistory] Carregando resultados para: ${widget.userId}');
      
      final results = await TestService.getUserTestResults(widget.userId);
      
      print('✅ [TestHistory] ${results.length} resultados carregados');
      
      setState(() {
        _results = results;
        _isLoading = false;
      });
    } catch (e) {
      print('❌ [TestHistory] Erro ao carregar resultados: $e');
      setState(() {
        _errorMessage = 'Erro ao carregar histórico';
        _isLoading = false;
      });
    }
  }

  // 🔥 NOVO MÉTODO: Navegar para cursos com pesquisa
  void _navigateToCoursesWithSearch(String searchTerm) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CoursesPage(
          isDarkMode: widget.isDarkMode,
          initialSearch: searchTerm, // 🔥 PASSAR PESQUISA INICIAL
        ),
      ),
    );
  }

  Color _getBackgroundColor() => widget.isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color _getTextColor() => widget.isDarkMode ? AppColors.darkText : AppColors.lightText;
  Color _getCardColor() => widget.isDarkMode ? AppColors.darkCard : AppColors.lightCard;
  Color _getGreyTextColor() => widget.isDarkMode ? AppColors.darkGreyText : AppColors.lightGreyText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      appBar: AppBar(
        title: Text('Meus Testes', style: TextStyle(color: _getTextColor())),
        backgroundColor: _getBackgroundColor(),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _getTextColor()),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading
          ? _buildLoading()
          : _errorMessage.isNotEmpty
              ? _buildError()
              : _results.isEmpty
                  ? _buildEmptyState()
                  : _buildResultsList(),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text(
            'Carregando seus testes...',
            style: TextStyle(color: _getTextColor()),
          ),
        ],
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 60, color: Colors.red),
          SizedBox(height: 20),
          Text(
            _errorMessage,
            style: TextStyle(color: _getTextColor(), fontSize: 18),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _loadResults,
            child: Text('Tentar Novamente'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.quiz_outlined, size: 80, color: _getTextColor().withOpacity(0.5)),
          SizedBox(height: 20),
          Text(
            'Nenhum teste realizado',
            style: TextStyle(
              fontSize: 18,
              color: _getTextColor(),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Faça seu primeiro teste vocacional\ne acompanhe seu progresso aqui.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: _getGreyTextColor(),
            ),
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text('Fazer Teste'),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Histórico de Testes',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: _getTextColor(),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${_results.length} teste${_results.length != 1 ? 's' : ''} realizado${_results.length != 1 ? 's' : ''}',
                  style: TextStyle(
                    color: _getGreyTextColor(),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          
          // Lista de resultados
          Expanded(
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final result = _results[index];
                return _buildResultCard(result, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultCard(TestResult result, int index) {
    final sortedIntelligences = result.areaScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    final topThree = sortedIntelligences.take(3).toList();
    final recommendedCourses = _getRecommendedCourses(result.areaScores);

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Card(
        color: _getCardColor(),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header do card
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Teste #${_results.length - index}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _getTextColor(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _formatDate(result.completedAt),
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 16),
              
              // Top 3 Inteligências
              Text(
                '🏆 Top 3 Inteligências',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _getTextColor(),
                ),
              ),
              SizedBox(height: 12),
              
              ...topThree.asMap().entries.map((entry) {
                final idx = entry.key;
                final intelligence = entry.value;
                final colors = [Colors.amber, Colors.blue, Colors.green];
                final icons = [Icons.emoji_events, Icons.star, Icons.thumb_up];
                
                return _buildIntelligenceRow(
                  intelligence.key, 
                  intelligence.value, 
                  colors[idx], 
                  icons[idx],
                  idx + 1
                );
              }),
              
              SizedBox(height: 16),
              
              // 🔥 CURSOS RECOMENDADOS - AGORA CLICÁVEIS
              Text(
                '🎯 Cursos Recomendados',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _getTextColor(),
                ),
              ),
              SizedBox(height: 12),
              
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: recommendedCourses.take(6).map((course) => 
                  GestureDetector(
                    onTap: () => _navigateToCoursesWithSearch(course),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.3),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          course,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ).toList(),
              ),
              
              SizedBox(height: 16),
              
              // Resumo
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getBackgroundColor(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  result.summary.length > 120 
                      ? '${result.summary.substring(0, 120)}...' 
                      : result.summary,
                  style: TextStyle(
                    color: _getGreyTextColor(),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIntelligenceRow(String intelligence, int percentage, Color color, IconData icon, int position) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${position}º ${_getIntelligenceName(intelligence)}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: _getTextColor(),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: LinearProgressIndicator(
                        value: percentage / 100,
                        backgroundColor: _getGreyTextColor().withOpacity(0.2),
                        color: color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '$percentage%',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 MÉTODO PARA OBTER CURSOS RECOMENDADOS
  List<String> _getRecommendedCourses(Map<String, int> areaScores) {
    final sortedIntelligences = areaScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    
    final topIntelligences = sortedIntelligences.take(3).map((e) => e.key).toList();
    final allCourses = <String>{};
    
    // Adicionar cursos das top 3 inteligências
    for (final intelligence in topIntelligences) {
      final courses = _getCoursesForIntelligence(intelligence);
      allCourses.addAll(courses);
    }
    
    // Se não tiver cursos suficientes, adicionar das próximas inteligências
    if (allCourses.length < 6) {
      final nextIntelligences = sortedIntelligences.skip(3).take(2).map((e) => e.key).toList();
      for (final intelligence in nextIntelligences) {
        if (allCourses.length >= 8) break;
        final courses = _getCoursesForIntelligence(intelligence);
        allCourses.addAll(courses);
      }
    }
    
    return allCourses.toList();
  }

  // 🔥 MAPEAMENTO DE INTELIGÊNCIAS PARA CURSOS
  List<String> _getCoursesForIntelligence(String intelligence) {
    final coursesMap = {
      'linguistic': [
        'Jornalismo',
        'Letras',
        'Direito',
        'Publicidade',
        'Relações Públicas',
        'Tradução',
        'Editoração',
        'Locução'
      ],
      'logical_mathematical': [
        'Engenharia',
        'Ciência da Computação',
        'Matemática',
        'Física',
        'Economia',
        'Contabilidade',
        'Estatística',
        'Arquitetura'
      ],
      'spatial': [
        'Design Gráfico',
        'Arquitetura',
        'Urbanismo',
        'Cinema',
        'Fotografia',
        'Design de Interiores',
        'Artes Visuais',
        'Moda'
      ],
      'bodily_kinesthetic': [
        'Educação Física',
        'Fisioterapia',
        'Dança',
        'Teatro',
        'Medicina',
        'Enfermagem',
        'Gastronomia',
        'Educação Artística'
      ],
      'musical': [
        'Música',
        'Composição',
        'Produção Musical',
        'Sonoplastia',
        'Musicoterapia',
        'Regência',
        'Engenharia de Som',
        'Artes Cênicas'
      ],
      'interpersonal': [
        'Psicologia',
        'Pedagogia',
        'Serviço Social',
        'Recursos Humanos',
        'Marketing',
        'Administração',
        'Medicina',
        'Enfermagem'
      ],
      'intrapersonal': [
        'Psicologia',
        'Filosofia',
        'Teologia',
        'Coaching',
        'Psicopedagogia',
        'Pesquisa',
        'Escrita Criativa',
        'Consultoria'
      ],
      'naturalist': [
        'Biologia',
        'Medicina Veterinária',
        'Agronomia',
        'Geologia',
        'Oceanografia',
        'Ecologia',
        'Farmácia',
        'Educação Ambiental'
      ],
    };
    
    return coursesMap[intelligence] ?? ['Curso Relacionado'];
  }

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

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Hoje';
    } else if (difference.inDays == 1) {
      return 'Ontem';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} dias atrás';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks} semana${weeks > 1 ? 's' : ''} atrás';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}