import 'package:flutter/foundation.dart';
import '../data/questions_data.dart';
import '../models/question.dart';

/// State management kuis. Karena state disimpan di sini (di luar widget),
/// progres jawaban tidak hilang saat layar dirotasi atau pindah halaman.
class QuizProvider extends ChangeNotifier {
  final List<Question> questions = daftarSoal;

  String _userName = '';
  int _currentIndex = 0;
  late List<int?> _answers = List.filled(questions.length, null);
  final List<ScoreEntry> _history = [];

  String get userName => _userName;
  int get currentIndex => _currentIndex;
  List<int?> get answers => _answers;
  List<ScoreEntry> get history => List.unmodifiable(_history);

  Question get currentQuestion => questions[_currentIndex];
  bool get isFirst => _currentIndex == 0;
  bool get isLast => _currentIndex == questions.length - 1;
  int? get selectedAnswer => _answers[_currentIndex];

  int get answeredCount => _answers.where((a) => a != null).length;

  int get score {
    int benar = 0;
    for (int i = 0; i < questions.length; i++) {
      if (_answers[i] == questions[i].correctIndex) benar++;
    }
    return benar;
  }

  void setName(String name) {
    _userName = name.trim();
    notifyListeners();
  }

  void selectAnswer(int optionIndex) {
    _answers[_currentIndex] = optionIndex;
    notifyListeners();
  }

  void next() {
    if (!isLast) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previous() {
    if (!isFirst) {
      _currentIndex--;
      notifyListeners();
    }
  }

  /// Dipanggil saat kuis selesai: simpan skor ke riwayat.
  void finishQuiz() {
    _history.insert(
      0,
      ScoreEntry(name: _userName, score: score, total: questions.length),
    );
    notifyListeners();
  }

  /// Mulai ulang kuis (nama tetap, jawaban dikosongkan).
  void restart() {
    _currentIndex = 0;
    _answers = List.filled(questions.length, null);
    notifyListeners();
  }
}
