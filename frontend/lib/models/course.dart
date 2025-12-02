
class Course {
  final String id;
  final String title;
  final String description;
  final List<String> areas;
  final double minSalary;
  final double maxSalary;
  final List<String> competencies;
  final String category;
  final int duration; // em semestres
  final String degreeType; // Bacharelado, Licenciatura, Tecnólogo
  final String university;
  final double rating;
  final int reviews;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.areas,
    required this.minSalary,
    required this.maxSalary,
    required this.competencies,
    required this.category,
    required this.duration,
    required this.degreeType,
    required this.university,
    this.rating = 0.0,
    this.reviews = 0,
  });

  String get salaryRange => 'R\$${minSalary.toStringAsFixed(0)} - R\$${maxSalary.toStringAsFixed(0)}';
  
  String get formattedDuration => '$duration semestres';
  
  String get formattedRating => rating.toStringAsFixed(1);
}