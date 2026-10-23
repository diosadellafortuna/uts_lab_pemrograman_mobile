import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/content_wrapper.dart';
import '../widgets/option_tile.dart';
import '../widgets/primary_button.dart';
import '../widgets/progress_header.dart';
import 'result_screen.dart';

/// Halaman 2: menjawab soal. StatelessWidget saja, karena semua state
/// (nomor soal, jawaban) ada di QuizProvider.
class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  static const _labels = ['A', 'B', 'C', 'D', 'E'];

  Future<bool> _konfirmasiKeluar(BuildContext context) async {
    final keluar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Keluar dari kuis?'),
        content: const Text('Progres jawabanmu akan direset.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
    return keluar ?? false;
  }

  void _selesai(BuildContext context) {
    final quiz = context.read<QuizProvider>();
    final belum = quiz.questions.length - quiz.answeredCount;

    if (belum > 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Masih ada $belum soal yang belum dijawab')),
      );
      return;
    }
    quiz.finishQuiz();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ResultScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final q = quiz.currentQuestion;
    final cs = Theme.of(context).colorScheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final keluar = await _konfirmasiKeluar(context);
        if (keluar && context.mounted) Navigator.pop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Halo, ${quiz.userName}'),
        ),
        body: ContentWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProgressHeader(
                current: quiz.currentIndex,
                total: quiz.questions.length,
              ),
              SizedBox(height: context.sp(20)),
              Container(
                padding: EdgeInsets.all(context.sp(16)),
                decoration: BoxDecoration(
                  color: cs.primaryContainer,
                  borderRadius: BorderRadius.circular(context.sp(16)),
                ),
                child: Text(
                  q.text,
                  style: TextStyle(
                    fontSize: context.sp(16),
                    fontWeight: FontWeight.w600,
                    color: cs.onPrimaryContainer,
                  ),
                ),
              ),
              SizedBox(height: context.sp(16)),
              for (int i = 0; i < q.options.length; i++)
                OptionTile(
                  label: _labels[i],
                  text: q.options[i],
                  selected: quiz.selectedAnswer == i,
                  onTap: () => quiz.selectAnswer(i),
                ),
              SizedBox(height: context.sp(12)),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: 'Kembali',
                      icon: Icons.arrow_back,
                      outlined: true,
                      onPressed: quiz.isFirst ? null : quiz.previous,
                    ),
                  ),
                  SizedBox(width: context.wp(3)),
                  Expanded(
                    child: quiz.isLast
                        ? PrimaryButton(
                            label: 'Selesai',
                            icon: Icons.check,
                            onPressed: () => _selesai(context),
                          )
                        : PrimaryButton(
                            label: 'Lanjut',
                            icon: Icons.arrow_forward,
                            onPressed:
                                quiz.selectedAnswer == null ? null : quiz.next,
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
