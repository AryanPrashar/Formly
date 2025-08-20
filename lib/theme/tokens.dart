import 'package:flutter/material.dart';

/// Design tokens matching the Figma system.
class Tokens {
  // Brand
  static const brand500 = Color(0xFFFF8C42);
  static const brand600 = Color(0xFFFF7A22);
  static const brand700 = Color(0xFFE06715);

  // Surfaces
  static const bg900 = Color(0xFF0C0C0C);
  static const bg800 = Color(0xFF151515);

  // Text
  static const text100 = Color(0xFFFFFFFF);
  static const text300 = Color(0xFFD7D7D7);
  static const text500 = Color(0xFFA0A0A0);

  // Semantic
  static const success500 = Color(0xFF34C759);
  static const danger500 = Color(0xFFFF3B30);
  static const warn500 = Color(0xFFFFD60A);

  // Spacing
  static const s4 = 4.0;
  static const s8 = 8.0;
  static const s12 = 12.0;
  static const s16 = 16.0;
  static const s24 = 24.0;
  static const s32 = 32.0;
  static const s48 = 48.0;

  // Radius
  static const r8  = 8.0;
  static const r16 = 16.0;
  static const r24 = 24.0;

  // Shadows
  static const elevation2 = [
    BoxShadow(color: Colors.black38, blurRadius: 6, offset: Offset(0, 2)),
  ];
  static const elevation8 = [
    BoxShadow(color: Colors.black54, blurRadius: 24, offset: Offset(0, 8)),
  ];
}