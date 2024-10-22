import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroMainViewmodel extends GetxController {
  RxBool isTermsAccepted = false.obs;

  void changeLanguage(String languageCode) {
    // مدیریت تغییر زبان
    if (languageCode == 'en') {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('fa', 'IR'));
    }
  }

  void startChallenge() {
    print("Challenge Started");
  }
}