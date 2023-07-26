import 'package:flutter/material.dart';
import 'package:light_dark_switch/app_theme.dart';
import 'package:light_dark_switch/constant/constant.dart';
import 'package:light_dark_switch/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLightTheme = prefs.getBool(SPref.isLight) ?? true;
  runApp(AppStart(
    isLightTheme: isLightTheme,
  ));
}

class AppStart extends StatelessWidget {
  const AppStart({super.key, required this.isLightTheme});

  final bool isLightTheme;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isLightTheme: isLightTheme),
      ),
    ], child: MyApp());
  }
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
