import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'intro_welcome_model.dart';

class IntroWelcomeViewmodel extends GetxController {
  final introPages = [
    IntroWelcomeModel(title: 'This is a test title', description: "This is a test description", image: "assets/jpg/intro1.jpg"),
    IntroWelcomeModel(title: 'This is a test title', description: "This is a test description", image: "assets/jpg/intro2.jpg"),
    IntroWelcomeModel(title: 'This is a test title', description: "This is a test description", image: "assets/jpg/intro3.jpg"),
  ].obs;

  var showGetStart = false.obs;

  // کنترل کننده صفحه
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
      pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
  }
}
