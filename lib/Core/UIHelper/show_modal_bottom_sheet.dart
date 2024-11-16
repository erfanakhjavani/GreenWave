
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';


class CustomModalBottomSheet extends StatelessWidget {
  final String imagePath;
  final String description;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const CustomModalBottomSheet({
    super.key,
    required this.imagePath,
    required this.description,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: screenHeight / 3,
      width: screenWidth / 1.05,
      padding: const EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[700],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Gap(20),
          Column(
            children: [
              Image.asset(imagePath, height: 100, fit: BoxFit.fill),
              const SizedBox(height: 20),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: onButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  buttonText,
                  style: textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




void showCustomModalBottomSheet({
  required String imagePath,
  required String description,
  required String buttonText,
  required VoidCallback onButtonPressed,
}) {
  Get.bottomSheet(
    CustomModalBottomSheet(
        imagePath: imagePath,
        description: description,
        buttonText: buttonText,
        onButtonPressed: onButtonPressed
    ),
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
  );
}