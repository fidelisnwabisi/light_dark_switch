import 'package:flutter/material.dart';
import 'package:light_dark_switch/app_theme.dart';
import 'package:light_dark_switch/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      DateTime.now().hour.toString(),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: size.width * .2,
                      child: const Divider(
                        height: 0,
                        thickness: 1,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      DateTime.now().minute.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColors.white),
                    ),
                    const Text(
                      "Light and Dark\nPersonal\nSwitch",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: size.width * .2,
                      height: size.width * .2,
                      decoration: BoxDecoration(
                        color: ThemeProvider(isLightTheme: true)
                            .themeMode()
                            .switchColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
