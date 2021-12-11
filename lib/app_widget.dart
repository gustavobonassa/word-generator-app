import 'package:flutter/material.dart';
import 'package:whatword/modules/home/home_page.dart';
import 'package:whatword/modules/splash/splash_page.dart';
import 'package:whatword/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatWord',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/home",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
