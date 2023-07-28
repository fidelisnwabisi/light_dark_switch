import 'package:flutter/material.dart';
import 'package:light_dark_switch/app_theme.dart';
import 'package:light_dark_switch/screen/components/left_part.dart';
import 'package:light_dark_switch/screen/components/wire_draw.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Offset initialPosition = const Offset(250, 0);
  Offset switchPosition = const Offset(350, 350);
  Offset containerPosition = const Offset(350, 350);
  Offset finalPosition = const Offset(350, 350);

  @override
  void didChangeDependencies() {
    final Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    initialPosition = Offset(size.width * .9, 0);
    containerPosition = Offset(size.width * .9, size.width * .4);
    finalPosition = Offset(size.width * .9, size.width * .5 - size.width * .1);
    if (themeProvider.isLightTheme) {
      switchPosition = containerPosition;
    } else {
      switchPosition = finalPosition;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   themeProvider.toggleThemeData();
      // }),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.8, -0.3),
            radius: 1,
            colors: themeProvider.themeMode().gradientColors!,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            LeftPart(size: size, themeProvider: themeProvider),
            Positioned(
              top: containerPosition.dy - size.width * .1 / 2 - 5,
              left: containerPosition.dx - size.width * .1 / 2 - 5,
              child: Container(
                width: size.width * .1 + 10,
                height: size.height * .1 + 10,
                decoration: BoxDecoration(
                  color: themeProvider.themeMode().switchBGColor!,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Wire(
              initialPosition: initialPosition,
              toOffset: switchPosition,
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 0),
              top: switchPosition.dy - size.width * 0.1 / 2,
              left: switchPosition.dx - size.width * 0.1 / 2,
              child: Draggable(
                feedback: Container(
                  width: size.width * .1,
                  height: size.height * .1,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                ),
                onDragEnd: (details) {
                  if (themeProvider.isLightTheme) {
                    setState(() {
                      switchPosition = containerPosition;
                    });
                  } else {
                    setState(() {
                      switchPosition = finalPosition;
                    });
                  }
                  themeProvider.toggleThemeData();
                },
                onDragUpdate: (details) {
                  setState(() {
                    switchPosition = details.localPosition;
                  });
                },
                child: Container(
                  width: size.width * .1,
                  height: size.height * .1,
                  decoration: BoxDecoration(
                    color: themeProvider.themeMode().thumbColor,
                    border: Border.all(
                      width: 5,
                      color: themeProvider.themeMode().switchColor!,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
