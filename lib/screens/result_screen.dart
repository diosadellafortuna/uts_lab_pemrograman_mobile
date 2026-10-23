import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_provider.dart';
import '../utils/responsive.dart';
import '../widgets/content_wrapper.dart';
import '../widgets/option_tile.dart';
import '../widgets/primary_button.dart';
import 'quiz_screen.dart';

/// Halaman 3: skor akhir + review jawaban.
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String _pesan(double persen) {
    if (persen >= 0.8) return 'Luar biasa! 🎉';
    if (persen >= 0.5) return 'Lumayan, terus belajar ya!';
    return 'Jangan menyerah, coba lagi!';
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final cs = Theme.of(context).colorScheme;
    final total = quiz.questions.length;
    final persen = quiz.score / total;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Kuis'),
        automaticallyImplyLeading: false,
      ),
      body: ContentWrapper(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(context.sp(20)),
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(context.sp(20)),
              ),
              child: Column(
                children: [
                  Icon(Icons.emoji_events,
                      size: context.sp(56), color: cs.primary),
                  SizedBox(height: context.sp(8)),
                  Text(
                    quiz.userName,
                    style: TextStyle(
                      fontSize: context.sp(18),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${quiz.score} / $total',
                    style: TextStyle(
                      fontSize: context.sp(44),
                      fontWeight: FontWeight.w700,
                      color: cs.primary,
                    ),
                  ),
                  Text(
                    'Nilai: ${(persen * 100).round()}',
                    style: TextStyle(fontSize: context.sp(14)),
                  ),
                  SizedBox(height: context.sp(6)),
                  Text(_pesan(persen),
                      style: TextStyle(fontSize: context.sp(14))),
                ],
              ),
            ),
            SizedBox(height: context.sp(20)),
            Text(
              'Review Jawaban',
              style: TextStyle(
                fontSize: context.sp(16),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: context.sp(10)),
            for (int i = 0; i < total; i++) _ReviewItem(index: i),
            SizedBox(height: context.sp(8)),
            PrimaryButton(
              label: 'Ulangi Kuis',
              icon: Icons.replay,
              onPressed: () {
                quiz.restart();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              },
            ),
            SizedBox(height: context.sp(10)),
            PrimaryButton(
              label: 'Kembali ke Beranda',
              icon: Icons.home_outlined,
              outlined: true,
              onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
            ),
          ],
        ),
      ),
    );
  }
}

/// Satu soal di bagian review.
class _ReviewItem extends StatelessWidget {
  final int index;
  const _ReviewItem({required this.index});

  @override
  Widget build(BuildContext context) {
    final quiz = context.read<QuizProvider>();
    final q = quiz.questions[index];
    final jawaban = quiz.answers[index];
    final benar = jawaban == q.correctIndex;

    return Card(
      margin: EdgeInsets.only(bottom: context.sp(10)),
      child: Padding(
        padding: EdgeInsets.all(context.sp(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  benar ? Icons.check_circle : Icons.cancel,
                  color: benar ? Colors.green : Colors.red,
                  size: context.sp(20),
                ),
                SizedBox(width: context.wp(2)),
                Expanded(
                  child: Text(
                    '${index + 1}. ${q.text}',
                    style: TextStyle(
                      fontSize: context.sp(13),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.sp(8)),
            if (!benar && jawaban != null)
              OptionTile(
                label: '✗',
                text: 'Jawabanmu: ${q.options[jawaban]}',
                selected: true,
                isCorrect: false,
              ),
            OptionTile(
              label: '✓',
              text: 'Jawaban benar: ${q.options[q.correctIndex]}',
              selected: true,
              isCorrect: true,
            ),
          ],
        ),
      ),
    );
  }
}
