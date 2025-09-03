import 'package:flutter/material.dart';

enum ScreenSize { sm, md, lg }

class ResponsiveHelper {
  static ScreenSize getScreenSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    if (width < 400 || height < 700) return ScreenSize.sm;
    if (width < 800 || height < 900) return ScreenSize.md;
    return ScreenSize.lg;
  }

  switchSize(size){}

  static EdgeInsets responsivePadding({
    required BuildContext context,
    required double sm,
    required double md,
    required double lg,
  }) {
    final size = getScreenSize(context);
    double value;
    switch (size) {
      case ScreenSize.sm:
        value = sm;
        break;
      case ScreenSize.md:
        value = md;
        break;
      case ScreenSize.lg:
        value = lg;
        break;
    }
    return EdgeInsets.all(value);
  }

  static double responsiveFontSize({
    required BuildContext context,
    required double sm,
    required double md,
    required double lg,
  }) {
    final size = getScreenSize(context);
    switch (size) {
      case ScreenSize.sm:
        return sm;
      case ScreenSize.md:
        return md;
      case ScreenSize.lg:
        return lg;
    }
  }

  //  static double responsiveFontSize(BuildContext context, double baseSize) {
  //   final width = MediaQuery.of(context).size.width;
  //   final scale = width / 375; // Based on iPhone 11 width
  //   return (baseSize * scale).clamp(baseSize * 0.85, baseSize * 1.2);
  // }
}

