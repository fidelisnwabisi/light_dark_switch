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
            center: const Alignment(-0.8, -0.3),
            radius: 1,
            colors:
                ThemeProvider(isLightTheme: true).themeMode().gradientColors!,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeArea(
              child: Column(
                children: [
                  Text(
                    DateTime.now().hour.toString(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    DateTime.now().minute.toString(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
