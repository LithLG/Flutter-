import 'package:flutter/material.dart';
import '../models/test_question.dart';
import '../models/test_result.dart';
import '../services/test_service.dart';
import '../services/auth_service.dart';
import 'test_result_page.dart';
import '../theme/app_colors.dart';

class TestQuestionsPage extends StatefulWidget {
  final bool isDarkMode;

  const TestQuestionsPage({required this.isDarkMode});

  @override
  _TestQuestionsPageState createState() => _TestQuestionsPageState();
}

class _TestQuestionsPageState extends State<TestQuestionsPage> {
  List<TestQuestion> _questions = [];
  int _currentQuestionIndex = 0;
  List<QuestionResponse> _responses = [];
  bool _isLoading = true;
  String? _selectedOptionId;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final questions = await TestService.getQuestions();
      setState(() {
        _questions = questions;
        _isLoading = false;
      });
    } catch (e) {
      print('❌ [TestQuestions] Erro ao carregar perguntas: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _selectOption(String optionId) {
    setState(() {
      _selectedOptionId = optionId;
    });
  }

  void _nextQuestion() {
    if (_selectedOptionId == null) return;

    // Salvar resposta
    final currentQuestion = _questions[_currentQuestionIndex];
    final selectedOption = currentQuestion.options.firstWhere((opt) => opt.id == _selectedOptionId);
    
    _responses.add(QuestionResponse(
      questionId: currentQuestion.id,
      optionId: selectedOption.id,
      questionText: currentQuestion.question,
      optionText: selectedOption.text,
    ));

    // Próxima pergunta ou finalizar
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionId = null;
      });
    } else {
      _finishTest();
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
        _responses.removeLast();
        _selectedOptionId = null;
      });
    }
  }

  Future<void> _finishTest() async {
    try {
      final user = await AuthService.getUser();

      // Calcular resultado
      final result = TestService.calculateMultipleIntelligencesResult(
        userId: user?.id ?? 'temp',
        responses: _responses,
      );

      print('🎯 [TestQuestions] Resultado calculado: ${result.areaScores.length} inteligências');

      if (user != null) {
        // 🔥 USUÁRIO LOGADO: salvar normalmente
        await TestService.saveTestResult(result);
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TestResultPage(
              result: result,
              isDarkMode: widget.isDarkMode,
              isTemporary: false,
            ),
          ),
        );
      } else {
        // 🔥 USUÁRIO NÃO LOGADO: salvar temporariamente
        await TestService.saveTemporaryResult(result);
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => TestResultPage(
              result: result,
              isDarkMode: widget.isDarkMode,
              isTemporary: true, // 🔥 INDICA QUE É TEMPORÁRIO
            ),
          ),
        );
      }

    } catch (e) {
      print('❌ [TestQuestions] Erro ao finalizar teste: $e');
      _showError('Erro ao processar resultado. Tente novamente.');
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Color _getBackgroundColor() => widget.isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color _getTextColor() => widget.isDarkMode ? AppColors.darkText : AppColors.lightText;
  Color _getCardColor() => widget.isDarkMode ? AppColors.darkCard : AppColors.lightCard;

  @override
  Widget build(BuildContext context) {
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
                'Carregando perguntas...',
                style: TextStyle(color: _getTextColor()),
              ),
            ],
          ),
        ),
      );
    }

    if (_questions.isEmpty) {
      return Scaffold(
        backgroundColor: _getBackgroundColor(),
        appBar: AppBar(
          title: Text('Erro', style: TextStyle(color: _getTextColor())),
          backgroundColor: _getBackgroundColor(),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: _getTextColor()),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, size: 60, color: Colors.red),
              SizedBox(height: 20),
              Text(
                'Não foi possível carregar as perguntas',
                style: TextStyle(color: _getTextColor(), fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Voltar'),
              ),
            ],
          ),
        ),
      );
    }

    final currentQuestion = _questions[_currentQuestionIndex];
    final progress = (_currentQuestionIndex + 1) / _questions.length;

    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      appBar: AppBar(
        title: Text('Teste de Inteligências Múltiplas', style: TextStyle(color: _getTextColor())),
        backgroundColor: _getBackgroundColor(),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: _getTextColor()),
          onPressed: () => _showExitDialog(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Progresso
            LinearProgressIndicator(
              value: progress,
              backgroundColor: _getCardColor(),
              color: AppColors.primary,
            ),
            SizedBox(height: 16),
            Text(
              'Pergunta ${_currentQuestionIndex + 1} de ${_questions.length}',
              style: TextStyle(
                color: _getTextColor(),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            SizedBox(height: 32),
            
            // Pergunta
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentQuestion.question,
                      style: TextStyle(
                        color: _getTextColor(),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    
                    SizedBox(height: 32),
                    
                    // Opções
                    ...currentQuestion.options.map((option) => _buildOptionButton(option)),
                  ],
                ),
              ),
            ),
            
            // Navegação
            SizedBox(height: 20),
            Row(
              children: [
                if (_currentQuestionIndex > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _previousQuestion,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: _getTextColor(),
                        side: BorderSide(color: _getTextColor()),
                        padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text('Voltar'),
                    ),
                  ),
                if (_currentQuestionIndex > 0) SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selectedOptionId != null ? _nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      _currentQuestionIndex < _questions.length - 1 ? 'Continuar' : 'Finalizar Teste',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(TestOption option) {
    final isSelected = _selectedOptionId == option.id;
    
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 12),
      child: OutlinedButton(
        onPressed: () => _selectOption(option.id),
        style: OutlinedButton.styleFrom(
          foregroundColor: _getTextColor(),
          side: BorderSide(
            color: isSelected ? AppColors.primary : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
          backgroundColor: isSelected ? AppColors.primary.withOpacity(0.1) : Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          option.text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: _getCardColor(),
        title: Text('Sair do Teste?', style: TextStyle(color: _getTextColor())),
        content: Text('Todo o seu progresso será perdido. Deseja realmente sair?', 
                     style: TextStyle(color: _getTextColor())),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar', style: TextStyle(color: _getTextColor())),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Sair', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}