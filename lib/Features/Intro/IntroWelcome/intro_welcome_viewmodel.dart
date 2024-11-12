import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Gen/assets.gen.dart';
import 'intro_welcome_model.dart';

class IntroWelcomeViewmodel extends GetxController {
  final introPages = [
    IntroWelcomeModel(
        title: 'This is a test title',
        description: "This is a test description",
        image: Assets.jpg.intro1.path),
    IntroWelcomeModel(
        title: 'This is a test title',
        description: "This is a test description",
        image: Assets.jpg.intro2.path),
    IntroWelcomeModel(
        title: 'This is a test title',
        description: "This is a test description",
        image: Assets.jpg.intro3.path),
  ].obs;

  var showGetStart = false.obs;

  PageController pageController = PageController();




}
