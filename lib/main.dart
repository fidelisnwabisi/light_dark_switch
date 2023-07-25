import 'package:flutter/material.dart';
import 'package:light_dark_switch/app_theme.dart';
import 'package:light_dark_switch/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeProvider(isLightTheme: true).themeData(),
      home: const HomeScreen(),
    );
  }
}
