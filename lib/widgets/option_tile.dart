import 'package:flutter/material.dart';
import '../utils/responsive.dart';

/// Satu pilihan jawaban (A, B, C, D).
/// Jika [showResult] true, warna menunjukkan benar/salah (dipakai di review).
class OptionTile extends StatelessWidget {
  final String label; // A, B, C, D
  final String text;
  final bool selected;
  final bool? isCorrect; // null = tidak ditampilkan
  final VoidCallback? onTap;

  const OptionTile({
    super.key,
    required this.label,
    required this.text,
    this.selected = false,
    this.isCorrect,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Color border = cs.outlineVariant;
    Color bg = cs.surface;
    if (isCorrect == true) {
      border = Colors.green;
      bg = Colors.green.withOpacity(0.12);
    } else if (isCorrect == false && selected) {
      border = Colors.red;
      bg = Colors.red.withOpacity(0.12);
    } else if (selected) {
      border = cs.primary;
      bg = cs.primaryContainer.withOpacity(0.5);
    }

    return Padding(
      padding: EdgeInsets.only(bottom: context.sp(10)),
      child: InkWell(
        borderRadius: BorderRadius.circular(context.sp(14)),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(context.sp(12)),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(context.sp(14)),
            border: Border.all(color: border, width: selected ? 2 : 1),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: context.sp(14),
                backgroundColor: selected ? cs.primary : cs.surfaceContainerHighest,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: context.sp(13),
                    fontWeight: FontWeight.w600,
                    color: selected ? cs.onPrimary : cs.onSurface,
                  ),
                ),
              ),
              SizedBox(width: context.wp(3)),
              Expanded(
                child: Text(text, style: TextStyle(fontSize: context.sp(14))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
