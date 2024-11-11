
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: Colors.blueGrey.withOpacity(0.8),
    colorText: Colors.white,
    icon: const Icon(Icons.info_outline, color: Colors.white, size: 28),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    borderRadius: 12,
    duration: const Duration(seconds: 4),
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.bounceIn,
    overlayBlur: 2,
    overlayColor: Colors.black.withOpacity(0.4),
    mainButton: TextButton(
      onPressed: () => Get.back(),
      child: const Text(
        "Close",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}