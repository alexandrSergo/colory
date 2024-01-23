import 'package:flutter/material.dart';

class MyGradient {
  final RGB color1;
  final RGB color2;
  final RGB color3;

  List<Color> getGradientList() {
    final c1 = Color.fromRGBO(color1.r, color1.g, color1.b, 1.0);
    final c2 = Color.fromRGBO(color2.r, color2.g, color2.b, 1.0);
    final c3 = Color.fromRGBO(color3.r, color3.g, color3.b, 1.0);
    return [c1, c2, c3];
  }

  MyGradient({required this.color1, required this.color2, required this.color3});
}

class RGB {
  final int r;
  final int g;
  final int b;

  String getRGBO() {
    return '$r, $g, $b, 1.0';
  }

  String getARGB() {
    return '255, $r, $g, $b';
  }

  String getHEX() {
    return "#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}";
  }

  RGB({required this.r, required this.g, required this.b});
}