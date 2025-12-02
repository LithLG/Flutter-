class TestResult {
  final String id;
  final String userId;
  final DateTime completedAt;
  final Map<String, int> areaScores; // 🔥 AGORA SÃO AS 8 INTELIGÊNCIAS
  final List<String> topAreas; // 🔥 TOP 3 INTELIGÊNCIAS
  final List<QuestionResponse> responses;
  final String summary;

  TestResult({
    required this.id,
    required this.userId,
    required this.completedAt,
    required this.areaScores,
    required this.topAreas,
    required this.responses,
    required this.summary,
  });

  factory TestResult.fromJson(Map<String, dynamic> json) {
    return TestResult(
      id: json['id'],
      userId: json['userId'],
      completedAt: DateTime.parse(json['completedAt']),
      areaScores: Map<String, int>.from(json['areaScores']),
      topAreas: List<String>.from(json['topAreas']),
      responses: (json['responses'] as List).map((r) => QuestionResponse.fromJson(r)).toList(),
      summary: json['summary'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'completedAt': completedAt.toIso8601String(),
      'areaScores': areaScores,
      'topAreas': topAreas,
      'responses': responses.map((r) => r.toJson()).toList(),
      'summary': summary,
    };
  }
}

class QuestionResponse {
  final String questionId;
  final String optionId;
  final String questionText;
  final String optionText;

  QuestionResponse({
    required this.questionId,
    required this.optionId,
    required this.questionText,
    required this.optionText,
  });

  factory QuestionResponse.fromJson(Map<String, dynamic> json) {
    return QuestionResponse(
      questionId: json['questionId'],
      optionId: json['optionId'],
      questionText: json['questionText'],
      optionText: json['optionText'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'questionId': questionId,
      'optionId': optionId,
      'questionText': questionText,
      'optionText': optionText,
    };
  }
}