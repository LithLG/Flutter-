// courses/course_detail_page.dart
import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../../theme/app_colors.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;
  final bool isDarkMode;

  const CourseDetailPage({
    Key? key,
    required this.course,
    required this.isDarkMode,
  }) : super(key: key);

  Color _getBackgroundColor() => isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color _getTextColor() => isDarkMode ? AppColors.darkText : AppColors.lightText;
  Color _getGreyTextColor() => isDarkMode ? AppColors.darkGreyText : AppColors.lightGreyText;
  Color _getPrimaryColor() => AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      appBar: AppBar(
        title: Text(
          course.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: _getPrimaryColor(),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CABEÇALHO DO CURSO
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _getPrimaryColor().withOpacity(0.1),
                    _getPrimaryColor().withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _getPrimaryColor().withOpacity(0.2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          course.title,
                          style: TextStyle(
                            color: _getTextColor(),
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getPrimaryColor(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          course.category,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 8),
                  
                  Text(
                    course.degreeType,
                    style: TextStyle(
                      color: _getGreyTextColor(),
                      fontSize: 16,
                    ),
                  ),
                  
                  SizedBox(height: 16),
                  
                  Row(
                    children: [
                      _buildInfoItem(Icons.schedule, course.formattedDuration),
                      SizedBox(width: 20),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),

            // 1. DESCRIÇÃO GERAL DO CURSO
            _buildSection(
              title: '1. Descrição Geral do Curso',
              content: course.description,
            ),

            SizedBox(height: 24),

            // 2. PERFIL PROFISSIONAL E ÁREAS DE ATUAÇÃO
            _buildSection(
              title: '2. Perfil Profissional e Áreas de Atuação',
              content: 'O profissional formado em ${course.title} pode atuar em diversos contextos, dependendo da área. Entre as possibilidades, destacam-se:',
              children: [
                SizedBox(height: 12),
                ...course.areas.map((area) => _buildBulletPoint(area)),
                SizedBox(height: 12),
                Text(
                  'As oportunidades podem incluir atuação em empresas privadas, organizações públicas, terceiro setor, consultorias especializadas, trabalhos autônomos e ambientes interdisciplinares.',
                  style: TextStyle(
                    color: _getGreyTextColor(),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            // 3. ESTIMATIVA DE SALÁRIOS
            _buildSection(
              title: '3. Estimativa de Salários (Brasil – 2024)',
              children: [
                SizedBox(height: 8),
                _buildSalaryItem('Faixa mínima:', 'R\$${course.minSalary.toStringAsFixed(0)}'),
                _buildSalaryItem('Faixa máxima:', 'R\$${course.maxSalary.toStringAsFixed(0)}'),
                SizedBox(height: 8),
                Text(
                  '(Valores aproximados, variam conforme região, experiência e área de atuação.)',
                  style: TextStyle(
                    color: _getGreyTextColor().withOpacity(0.7),
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            // 4. COMPETÊNCIAS DESENVOLVIDAS
            _buildSection(
              title: '4. Competências Desenvolvidas',
              content: 'Durante o curso, são desenvolvidas competências como:',
              children: [
                SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: course.competencies.map((competency) => 
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getPrimaryColor().withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _getPrimaryColor().withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        competency,
                        style: TextStyle(
                          color: _getTextColor(),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ).toList(),
                ),
              ],
            ),

            SizedBox(height: 32),

          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    String? content,
    List<Widget>? children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: _getTextColor(),
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        
        SizedBox(height: 8),
        
        if (content != null)
          Text(
            content,
            style: TextStyle(
              color: _getGreyTextColor(),
              fontSize: 14,
              height: 1.5,
            ),
          ),
        
        if (children != null) ...children,
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6, right: 8),
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: _getPrimaryColor(),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: _getGreyTextColor(),
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalaryItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: _getGreyTextColor(),
              fontSize: 14,
            ),
          ),
          SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              color: _getPrimaryColor(),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          color: _getPrimaryColor(),
          size: 20,
        ),
        SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            color: _getTextColor(),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}