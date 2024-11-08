import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Services/choice_image.dart';

class MainWrapperHomeViewmodel extends GetxController {
  final ChoiceImage choiceImage = ChoiceImage();
  var selectedImage1 = Rx<File?>(null);
  var selectedImage2 = Rx<File?>(null);

  Future<void> selectImageFromCamera() async {
    await choiceImage.chooseImageC();
    selectedImage1.value = choiceImage.uploadImage;
  }

  Future<void> selectImageFromGallery() async {
    await choiceImage.chooseImageG();
    selectedImage2.value = choiceImage.uploadImage;
  }

  // وضعیت کلیک روی آواتار
  var clickedIndex = (-1).obs;
  var isLoading = List<bool>.filled(5, false).obs;

  void toggleAvatarClicked(int index) {
    if (clickedIndex.value != index) {
      clickedIndex.value = index;
      isLoading[index] = true;

      Future.delayed(const Duration(seconds: 3), () {
        isLoading[index] = false;
        clickedIndex.value = -1;
      });
    }
  }

  Color avatarBorderColor(int index) {
    if (isLoading[index]) {
      return Colors.grey;
    }
    return clickedIndex.value == index ? Colors.grey : Colors.green;
  }

  var showImageDialog = true.obs;
  var selectedCode = (-1).obs;
  var isSelectedContainer = false.obs;


  void selectContainer(int code) {
    selectedCode.value = code;
  }

  Color getContainerColor(int code) {
    return selectedCode.value == code ? Colors.green : Colors.blue;
  }
}
