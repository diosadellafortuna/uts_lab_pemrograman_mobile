import 'package:flutter/material.dart';
import '../utils/responsive.dart';

/// Header progres: "Soal 2 dari 8" + progress bar.
class ProgressHeader extends StatelessWidget {
  final int current; // mulai dari 0
  final int total;

  const ProgressHeader({super.key, required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Soal ${current + 1} dari $total',
          style: TextStyle(fontSize: context.sp(14), fontWeight: FontWeight.w600),
        ),
        SizedBox(height: context.sp(8)),
        ClipRRect(
          borderRadius: BorderRadius.circular(context.sp(8)),
          child: LinearProgressIndicator(
            value: (current + 1) / total,
            minHeight: context.sp(8),
          ),
        ),
      ],
    );
  }
}
