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

  void onPageChanged(int index) {
    if (index == introPages.length - 1) {
      showGetStart.value = true;
    } else {
      showGetStart.value = false;
    }
  }

  void nextPage() {
    if (pageController.page!.toInt() < introPages.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }
}
