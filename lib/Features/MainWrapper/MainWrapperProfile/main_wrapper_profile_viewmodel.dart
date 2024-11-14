
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainWrapperProfileViewmodel extends GetxController {


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


}