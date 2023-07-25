import 'package:flutter/material.dart';
import 'package:light_dark_switch/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors:
                ThemeProvider(isLightTheme: true).themeMode().gradientColors!,
          ),
        ),
      ),
    );
  }
}
