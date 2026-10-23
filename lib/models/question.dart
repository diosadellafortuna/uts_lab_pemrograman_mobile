class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

class ScoreEntry {
  final String name;
  final int score;
  final int total;

  const ScoreEntry({
    required this.name,
    required this.score,
    required this.total,
  });
}
