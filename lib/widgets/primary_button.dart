import 'package:flutter/material.dart';
import '../utils/responsive.dart';

/// Tombol utama yang dipakai di banyak halaman.
class PrimaryButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool outlined;

  const PrimaryButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: context.sp(20)),
          SizedBox(width: context.wp(2)),
        ],
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: context.sp(15), fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(context.sp(14)),
    );
    final padding = EdgeInsets.symmetric(
      vertical: context.sp(14),
      horizontal: context.wp(4),
    );

    return outlined
        ? OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(shape: shape, padding: padding),
            child: child,
          )
        : FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(shape: shape, padding: padding),
            child: child,
          );
  }
}
