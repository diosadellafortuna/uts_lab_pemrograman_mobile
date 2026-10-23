import 'package:flutter/material.dart';
import '../utils/responsive.dart';

/// Membungkus isi halaman: bisa di-scroll (anti overflow saat landscape)
/// dan lebarnya dibatasi agar rapi di tablet / browser.
class ContentWrapper extends StatelessWidget {
  final Widget child;

  const ContentWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: context.maxContentWidth),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: context.wp(5).clamp(16.0, 32.0),
              vertical: context.sp(16),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
