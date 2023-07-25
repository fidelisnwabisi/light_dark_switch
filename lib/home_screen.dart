import 'package:flutter/material.dart';
import 'package:light_dark_switch/constant/constant.dart';

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
          // decoration: const BoxDecoration(
          //   gradient: RadialGradient(
          //     colors: [AppColors.yellow, AppColors.orange],
          //   ),
          // ),
          ),
    );
  }
}
