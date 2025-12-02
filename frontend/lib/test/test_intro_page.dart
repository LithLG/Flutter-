import 'package:flutter/material.dart';
import 'test_questions_page.dart';
import '../theme/app_colors.dart';

class TestIntroPage extends StatelessWidget {
  final bool isDarkMode;

  const TestIntroPage({required this.isDarkMode});

  Color _getBackgroundColor() => isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color _getTextColor() => isDarkMode ? AppColors.darkText : AppColors.lightText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      appBar: AppBar(
        title: Text('Teste de Inteligências Múltiplas', style: TextStyle(color: _getTextColor())),
        backgroundColor: _getBackgroundColor(),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _getTextColor()),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 600),
                child: Container(
                  padding: EdgeInsets.all(20),
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
                      Icon(Icons.psychology_alt, size: 60, color: Colors.white),
                      SizedBox(height: 16),
                      Text(
                        'Descubra Suas 8 Inteligências',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Teste Baseado na Teoria das Inteligências Múltiplas',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.9),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 32),
            
            // Informações do teste ATUALIZADAS
            _buildInfoItem(Icons.help, '32 Perguntas', 'Avalie suas 8 inteligências diferentes'),
            _buildInfoItem(Icons.schedule, '10-15 Minutos', 'Tempo estimado para completar o teste'),
            _buildInfoItem(Icons.analytics, 'Resultado Detalhado', 'Análise completa das suas inteligências predominantes'),
            _buildInfoItem(Icons.emoji_events, '8 Inteligências', 'Linguística, Lógico-Matemática, Espacial, Corporal, Musical, Interpessoal, Intrapessoal, Naturalista'),
            
            Spacer(),
            
            // Botão de iniciar
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestQuestionsPage(isDarkMode: isDarkMode),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                child: Text(
                  '🧠 Começar Teste de Inteligências',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String subtitle) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: _getTextColor(),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isDarkMode ? AppColors.darkGreyText : AppColors.lightGreyText,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}