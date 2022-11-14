import 'package:flutter/material.dart';

const Color splashBGColor = Color(0xffD7FFFD);
const Color btnColor1 = Color((0xff67EAE3));
const Color btnColor2 = Color((0xff00716C));
const Color textColor = Color((0xff018F89));
const Color addProductColor = Color((0xffEEF0FF));
const Color cardColor = Color((0xffEFF0FF));

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}
