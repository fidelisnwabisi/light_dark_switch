import 'package:flutter/material.dart';

import 'constant/constant.dart';

class ThemeProvider {
  bool isLightTheme;
  ThemeProvider({required this.isLightTheme});

  ThemeData themeData() {
    return ThemeData(
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor:
          isLightTheme ? AppColors.yellow : AppColors.black,
    );
  }

  ThemeMode themeMode() {
    return ThemeMode(
      gradientColors: isLightTheme
          ? [AppColors.yellow, AppColors.yellowDark]
          : [AppColors.black, AppColors.black],
      switchColor: isLightTheme ? AppColors.black : AppColors.orange,
      thumbColor: isLightTheme ? AppColors.orange : AppColors.black,
      switchBGColor: isLightTheme
          ? AppColors.black.withOpacity(0.1)
          : AppColors.grey.withOpacity(0.3),
    );
  }
}

class ThemeMode {
  List? gradientColors;
  Color? switchColor;
  Color? thumbColor;
  Color? switchBGColor;

  ThemeMode({
    this.gradientColors,
    this.switchBGColor,
    this.switchColor,
    this.thumbColor,
  });
}
