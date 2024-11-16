import 'dart:ui';

import 'package:GreenWave/Core/Constants/app_route.dart';
import 'package:GreenWave/Features/Intro/IntroMain/intro_main_view.dart';
import 'package:GreenWave/Features/Intro/IntroSplash/intro_splash_view.dart';
import 'package:GreenWave/Features/Intro/IntroWelcome/intro_welcome_view.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_view.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperProfile/main_wrapper_profile_view.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperWallet/main_wrapper_wallet_view.dart';
import 'package:GreenWave/telegram_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Core/Bindings/bindings.dart';
import 'Core/Themes/themes.dart';

//! Main function to initialize the app and set up system configurations
void main() async {
 runApp(const Main()); //* Run the main app widget
}

//! Main class for the app, extends StatelessWidget
class Main extends GetView<TelegramController> {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //* Disable debug banner
      theme: Themes.light,
      //* Define light theme
      initialBinding: MyBindings(),
      home: IntroSplashView(),
    );
  }
}
