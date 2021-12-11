import 'package:flutter/material.dart';
import 'package:whatword/shared/themes/app_colors.dart';
import 'package:whatword/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          child: Center(
              child: Image.asset(
            AppImages.logoFull,
            width: 250,
          )),
        ));
  }
}
