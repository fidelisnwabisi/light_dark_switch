import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant/constant.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;
  ThemeProvider({required this.isLightTheme});

  getCurrentStatusNavigationBarColor() {
    if (isLightTheme) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.navColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ));
    }
  }

  // use to toggle the theme
  toggleThemeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (isLightTheme) {
      sharedPreferences.setBool(SPref.isLight, false);
      isLightTheme = !isLightTheme;
      notifyListeners();
    } else {
      sharedPreferences.setBool(SPref.isLight, true);
      isLightTheme = !isLightTheme;
      notifyListeners();
    }
    getCurrentStatusNavigationBarColor();
    notifyListeners();
  }

  ThemeData themeData() {
    return ThemeData(
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor:
          isLightTheme ? AppColors.yellow : AppColors.black,
      textTheme: TextTheme(
        displayLarge: GoogleFonts.stickNoBills(
          fontSize: 70,
          fontWeight: FontWeight.w600,
          color: isLightTheme ? AppColors.black : AppColors.orange,
        ),
        displayMedium: GoogleFonts.robotoCondensed(
          fontWeight: FontWeight.w500,
          color: isLightTheme ? AppColors.black : AppColors.orange,
        ),
      ),
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
  List<Color>? gradientColors;
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
