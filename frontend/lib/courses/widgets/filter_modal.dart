// courses/widgets/filter_modal.dart
import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class FilterModal extends StatefulWidget {
  final bool isDarkMode;
  final Function({
    double? minSalary,
    double? maxSalary,
    int? minDuration,
    int? maxDuration,
    List<String>? degreeTypes,
  }) onApplyFilters;
  final double currentMinSalary;
  final double currentMaxSalary;
  final int currentMinDuration;
  final int currentMaxDuration;
  final List<String> currentDegreeTypes;

  const FilterModal({
    Key? key,
    required this.isDarkMode,
    required this.onApplyFilters,
    this.currentMinSalary = 0,
    this.currentMaxSalary = 50000,
    this.currentMinDuration = 0,
    this.currentMaxDuration = 12,
    this.currentDegreeTypes = const [],
  }) : super(key: key);

  @override
  _FilterModalState createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late double _minSalary;
  late double _maxSalary;
  late int _minDuration;
  late int _maxDuration;
  late List<String> _selectedDegreeTypes;

  @override
  void initState() {
    super.initState();
    _minSalary = widget.currentMinSalary;
    _maxSalary = widget.currentMaxSalary;
    _minDuration = widget.currentMinDuration;
    _maxDuration = widget.currentMaxDuration;
    _selectedDegreeTypes = List.from(widget.currentDegreeTypes);
  }

  Color _getBackgroundColor() => widget.isDarkMode ? AppColors.darkBackground : AppColors.lightBackground;
  Color _getTextColor() => widget.isDarkMode ? AppColors.darkText : AppColors.lightText;
  Color _getCardColor() => widget.isDarkMode ? AppColors.darkCard : AppColors.lightCard;
  Color _getGreyTextColor() => widget.isDarkMode ? AppColors.darkGreyText : AppColors.lightGreyText;
  Color _getPrimaryColor() => AppColors.primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: _getGreyTextColor().withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filtros Avançados',
                style: TextStyle(
                  color: _getTextColor(),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _minSalary = 0;
                    _maxSalary = 50000;
                    _minDuration = 0;
                    _maxDuration = 12;
                    _selectedDegreeTypes = [];
                  });
                },
                child: Text(
                  'Limpar',
                  style: TextStyle(
                    color: _getPrimaryColor(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          
          // FILTRO DE SALÁRIO
          Text(
            'Faixa Salarial (R\$)',
            style: TextStyle(
              color: _getTextColor(),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Mínimo',
                    labelStyle: TextStyle(color: _getGreyTextColor()),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _minSalary = double.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Máximo',
                    labelStyle: TextStyle(color: _getGreyTextColor()),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _maxSalary = double.tryParse(value) ?? 50000;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          
          // FILTRO DE DURAÇÃO
          Text(
            'Duração (semestres)',
            style: TextStyle(
              color: _getTextColor(),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Mínimo',
                    labelStyle: TextStyle(color: _getGreyTextColor()),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _minDuration = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Máximo',
                    labelStyle: TextStyle(color: _getGreyTextColor()),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      _maxDuration = int.tryParse(value) ?? 12;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          
          // FILTRO DE TIPO DE CURSO
          Text(
            'Tipo de Curso',
            style: TextStyle(
              color: _getTextColor(),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildDegreeTypeChip('Bacharelado'),
              _buildDegreeTypeChip('Licenciatura'),
              _buildDegreeTypeChip('Tecnólogo'),
            ],
          ),
          SizedBox(height: 32),
          
          // BOTÃO APLICAR FILTROS
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.onApplyFilters(
                  minSalary: _minSalary,
                  maxSalary: _maxSalary,
                  minDuration: _minDuration,
                  maxDuration: _maxDuration,
                  degreeTypes: _selectedDegreeTypes,
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _getPrimaryColor(),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Aplicar Filtros',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildDegreeTypeChip(String degreeType) {
    final isSelected = _selectedDegreeTypes.contains(degreeType);
    return FilterChip(
      label: Text(
        degreeType,
        style: TextStyle(
          color: isSelected ? Colors.white : _getTextColor(),
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            _selectedDegreeTypes.add(degreeType);
          } else {
            _selectedDegreeTypes.remove(degreeType);
          }
        });
      },
      backgroundColor: _getCardColor(),
      selectedColor: _getPrimaryColor(),
      checkmarkColor: Colors.white,
      shape: StadiumBorder(
        side: BorderSide(
          color: _getGreyTextColor().withOpacity(0.3),
        ),
      ),
    );
  }
}