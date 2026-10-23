import 'dart:math';
import 'package:flutter/material.dart';

/// Helper ukuran dinamis supaya tidak ada angka hardcode.
/// wp = persen lebar layar, hp = persen tinggi layar, sp = ukuran teks.
extension ResponsiveX on BuildContext {
  Size get _size => MediaQuery.sizeOf(this);

  double wp(double persen) => _size.width * persen / 100;
  double hp(double persen) => _size.height * persen / 100;

  /// Ukuran font mengikuti sisi terpendek layar (dibatasi agar tidak
  /// terlalu besar di tablet / web).
  double sp(double dasar) {
    final sisi = min(_size.shortestSide, 600.0);
    return dasar * sisi / 400;
  }

  /// Lebar maksimal konten, agar tampilan tetap rapi di tablet / browser.
  double get maxContentWidth => 600;
}
