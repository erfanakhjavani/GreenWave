import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWrapperHomeViewmodel extends GetxController {
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



  //! For first dialog to get choices image
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