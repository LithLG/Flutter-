// courses/courses_page.dart
import 'package:flutter/material.dart';
import '../../models/course.dart';
import '../../services/course_service.dart';
import '../../theme/app_colors.dart';
import 'course_detail_page.dart';
import 'widgets/filter_modal.dart';
import 'package:flutter/gestures.dart';

class CoursesPage extends StatefulWidget {
  final bool isDarkMode;
  final String? initialSearch;

  const CoursesPage({Key? key, required this.isDarkMode, required this.initialSearch}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _categoryScrollController = ScrollController();
  List<Course> _filteredCourses = [];
  String _selectedCategory = 'Todos';
  bool _isLoading = false;

  // Filtros avançados
  double _minSalary = 0;
  double _maxSalary = 50000;
  int _minDuration = 0;
  int _maxDuration = 12;
  List<String> _selectedDegreeTypes = [];

  @override
  void initState() {
    super.initState();
    _filteredCourses = CourseService.getAllCourses();
    _searchController.addListener(_searchCourses);

    if (widget.initialSearch != null) {
    _searchController.text = widget.initialSearch!;
    _applyFilters();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _categoryScrollController.dispose();
    super.dispose();
  }

  void _searchCourses() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _applyFilters();
          _isLoading = false;
        });
      }
    });
  }

  void _applyFilters() {
    final query = _searchController.text;
    _filteredCourses = CourseService.filterCourses(
      query: query,
      category: _selectedCategory,
      minSalary: _minSalary,
      maxSalary: _maxSalary,
      minDuration: _minDuration,
      maxDuration: _maxDuration,
      degreeTypes: _selectedDegreeTypes,
    );
  }

  void _onCategoryChanged(String? category) {
    if (category != null) {
      setState(() {
        _selectedCategory = category;
        _applyFilters();
      });
    }
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterModal(
        isDarkMode: widget.isDarkMode,
        onApplyFilters: ({
          double? minSalary,
          double? maxSalary,
          int? minDuration,
          int? maxDuration,
          List<String>? degreeTypes,
        }) {
          setState(() {
            _minSalary = minSalary ?? 0;
            _maxSalary = maxSalary ?? 50000;
            _minDuration = minDuration ?? 0;
            _maxDuration = maxDuration ?? 12;
            _selectedDegreeTypes = degreeTypes ?? [];
            _applyFilters();
          });
        },
        currentMinSalary: _minSalary,
        currentMaxSalary: _maxSalary,
        currentMinDuration: _minDuration,
        currentMaxDuration: _maxDuration,
        currentDegreeTypes: _selectedDegreeTypes,
      ),
    );
  }

  Color _getBackgroundColor() => widget.isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color _getTextColor() => widget.isDarkMode ? AppColors.darkText : AppColors.lightText;
  Color _getCardColor() => widget.isDarkMode ? AppColors.darkCard : AppColors.lightCard;
  Color _getGreyTextColor() => widget.isDarkMode ? AppColors.darkGreyText : AppColors.lightGreyText;
  Color _getPrimaryColor() => AppColors.primary;

  @override
  Widget build(BuildContext context) {
    final categories = ['Todos'] + CourseService.getCategories();
    
    return Scaffold(
      backgroundColor: _getBackgroundColor(),
      appBar: AppBar(
        title: Text(
          'Explorar Cursos',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        backgroundColor: _getPrimaryColor(),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: _showFilterModal,
            tooltip: 'Filtros avançados',
          ),
        ],
      ),
      body: Column(
        children: [
          // 🔥 BARRA DE PESQUISA E FILTROS
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _getPrimaryColor().withOpacity(0.1),
              border: Border(
                bottom: BorderSide(
                  color: _getGreyTextColor().withOpacity(0.2),
                ),
              ),
            ),
            child: Column(
              children: [
                // BARRA DE PESQUISA
                Container(
                  decoration: BoxDecoration(
                    color: _getCardColor(),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Pesquisar cursos...',
                      hintStyle: TextStyle(color: _getGreyTextColor()),
                      prefixIcon: Icon(Icons.search, color: _getGreyTextColor()),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    ),
                    style: TextStyle(color: _getTextColor()),
                  ),
                ),
                
                SizedBox(height: 12),
                
                // 🔥 FILTRO POR CATEGORIA COM SCROLL HORIZONTAL ARRASTÁVEL
                Container(
                  height: 50,
                  child: _buildCategoryScroll(categories),
                ),
              ],
            ),
          ),

          // 🔥 LISTA DE CURSOS
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(_getPrimaryColor()),
                    ),
                  )
                : _filteredCourses.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: 64,
                              color: _getGreyTextColor().withOpacity(0.5),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Nenhum curso encontrado',
                              style: TextStyle(
                                color: _getGreyTextColor(),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Tente ajustar sua pesquisa ou filtro',
                              style: TextStyle(
                                color: _getGreyTextColor().withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemCount: _filteredCourses.length,
                        itemBuilder: (context, index) {
                          final course = _filteredCourses[index];
                          return _buildCourseCard(course);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  // 🔥 NOVO MÉTODO PARA CONSTRUIR O SCROLL DE CATEGORIAS
  Widget _buildCategoryScroll(List<String> categories) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          // Permite arrastar com mouse, touch, etc.
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.stylus,
          PointerDeviceKind.trackpad,
        },
      ),
      child: SingleChildScrollView(
        controller: _categoryScrollController,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(), // Efeito de bounce para melhor UX
        child: Row(
          children: categories.map((category) {
            final isSelected = _selectedCategory == category;
            
            return Padding(
              padding: EdgeInsets.only(right: 8),
              child: FilterChip(
                label: Text(
                  category,
                  style: TextStyle(
                    color: isSelected ? Colors.white : _getTextColor(),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                selected: isSelected,
                onSelected: (selected) {
                  _onCategoryChanged(selected ? category : 'Todos');
                },
                backgroundColor: _getCardColor(),
                selectedColor: _getPrimaryColor(),
                checkmarkColor: Colors.white,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: _getGreyTextColor().withOpacity(0.3),
                  ),
                ),
                // 🔥 EFEITO VISUAL DE HOVER PARA DESKTOP
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCourseCard(Course course) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: _getCardColor(),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetailPage(
                course: course,
                isDarkMode: widget.isDarkMode,
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
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
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getPrimaryColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: _getPrimaryColor().withOpacity(0.3),
                      ),
                    ),
                    child: Text(
                      course.category,
                      style: TextStyle(
                        color: _getPrimaryColor(),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 8),
              
              Row(
                children: [
                  Icon(Icons.school, size: 16, color: _getGreyTextColor()),
                  SizedBox(width: 4),
                  Text(
                    course.degreeType,
                    style: TextStyle(
                      color: _getGreyTextColor(),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 16),
                ],
              ),
              
              SizedBox(height: 12),
              
              Text(
                course.description.length > 150
                    ? '${course.description.substring(0, 150)}...'
                    : course.description,
                style: TextStyle(
                  color: _getGreyTextColor(),
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              
              SizedBox(height: 16),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Duração',
                        style: TextStyle(
                          color: _getGreyTextColor(),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        course.formattedDuration,
                        style: TextStyle(
                          color: _getTextColor(),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Salário Estimado',
                        style: TextStyle(
                          color: _getGreyTextColor(),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        course.salaryRange,
                        style: TextStyle(
                          color: _getPrimaryColor(),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              
              SizedBox(height: 8),
              
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Ver detalhes →',
                  style: TextStyle(
                    color: _getPrimaryColor(),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}