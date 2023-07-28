import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:light_dark_switch/app_theme.dart';
import 'package:light_dark_switch/constant/constant.dart';

class LeftPart extends StatelessWidget {
  const LeftPart({
    super.key,
    required this.size,
    required this.themeProvider,
  });

  final Size size;
  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat("H").format(DateTime.now()),
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
              DateFormat("m").format(DateTime.now()),
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
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
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
    );
  }
}
