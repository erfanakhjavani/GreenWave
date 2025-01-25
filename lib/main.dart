
import 'package:GreenWave/Features/Intro/IntroSplash/intro_splash_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/Bindings/bindings.dart';
import 'Core/Themes/themes.dart';

//! Main function to initialize the app and set up system configurations
void main() async {
 runApp(const Main()); //* Run the main app widget
}

//! Main class for the app, extends StatelessWidget
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //* Disable debug banner
      theme: Themes.light,
      //* Define light theme
      initialBinding: MyBindings(),
      home: const IntroSplashView(),
    );
  }
}
