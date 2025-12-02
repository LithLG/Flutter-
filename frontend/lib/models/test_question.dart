class TestQuestion {
  final String id;
  final String question;
  final List<TestOption> options;
  final String category; // 🔥 AGORA SÃO AS CATEGORIAS DAS INTELIGÊNCIAS

  TestQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.category,
  });

  factory TestQuestion.fromJson(Map<String, dynamic> json) {
    return TestQuestion(
      id: json['id'],
      question: json['question'],
      options: (json['options'] as List).map((option) => TestOption.fromJson(option)).toList(),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'options': options.map((option) => option.toJson()).toList(),
      'category': category,
    };
  }
}

class TestOption {
  final String id;
  final String text;
  final Map<String, int> areaScores; // 🔥 MANTIDO PARA COMPATIBILIDADE, MAS NÃO USADO NO NOVO CÁLCULO

  TestOption({
    required this.id,
    required this.text,
    required this.areaScores,
  });

  factory TestOption.fromJson(Map<String, dynamic> json) {
    return TestOption(
      id: json['id'],
      text: json['text'],
      areaScores: Map<String, int>.from(json['areaScores']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'areaScores': areaScores,
    };
  }
}