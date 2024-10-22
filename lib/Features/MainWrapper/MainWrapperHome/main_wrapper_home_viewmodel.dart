import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWrapperHomeViewmodel extends GetxController {
  var clickedIndex = (-1).obs;
  var isLoading = List<bool>.filled(5, false).obs;

  // تابع برای مدیریت تغییر وضعیت کلیک
  void toggleAvatarClicked(int index) {
    if (clickedIndex.value != index) {
      clickedIndex.value = index; // آواتار کلیک شده
      isLoading[index] = true; // شروع لودینگ

      // پس از ۳ ثانیه، لودینگ را متوقف کن و وضعیت را بازنشانی کن
      Future.delayed(const Duration(seconds: 3), () {
        isLoading[index] = false; // پایان لودینگ
        clickedIndex.value = -1; // هیچ آواتاری کلیک نشده
      });
    }
  }

  Color avatarBorderColor(int index) {
    // تعیین رنگ حلقه بر اساس وضعیت کلیک و لودینگ
    if (isLoading[index]) {
      return Colors.grey; // در حال لودینگ
    }
    return clickedIndex.value == index ? Colors.grey : Colors.green; // رنگ بر اساس وضعیت کلیک
  }
}