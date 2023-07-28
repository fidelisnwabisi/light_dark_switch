import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:light_dark_switch/app_theme.dart';
import 'package:light_dark_switch/constant/constant.dart';
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
      floatingActionButton: FloatingActionButton(onPressed: () {
        themeProvider.toggleThemeData();
      }),
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
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // DateTime.now().hour.toString(),
                      "17",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: size.width * .17,
                      child: const Divider(
                        height: 0,
                        thickness: 1,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      // DateTime.now().minute.toString(),
                      "22",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: AppColors.white),
                    ),
                    const Spacer(),
                    const Text(
                      "Light and Dark\nPersonal\nSwitch",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: size.width * .2,
                      height: size.width * .2,
                      decoration: BoxDecoration(
                        color: themeProvider.themeMode().switchColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.nights_stay_outlined,
                        size: 50,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: size.width * .2,
                      child: const Divider(
                        // height: 0,
                        thickness: 1,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "30\u00B0C",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                color: AppColors.white,
                              ),
                    ),
                    Text(
                      "Clear",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      DateFormat("EEEE").format(DateTime.now()),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      DateFormat("MMMM d").format(DateTime.now()),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ),
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
            )
          ],
        ),
      ),
    );
  }
}