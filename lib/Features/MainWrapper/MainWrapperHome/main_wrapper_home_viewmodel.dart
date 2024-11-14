import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainWrapperHomeViewmodel extends GetxController {
  var clickedIndex = (-1).obs;
  var isLoading = List<bool>.generate(5, (_) => false).obs;

  // Post-like management
  var postLikes = List<int>.generate(10, (_) => 0).obs;
  var postDislikes = List<int>.generate(10, (_) => 0).obs;
  var isPostLiked = List<bool>.generate(10, (_) => false).obs;
  var isPostDisliked = List<bool>.generate(10, (_) => false).obs;

  void toggleAvatarClicked(int index) {
    if (clickedIndex.value != index) {
      clickedIndex.value = index;
      isLoading[index] = true;
      Future.delayed(const Duration(seconds: 3), () {
        isLoading[index] = false;
        clickedIndex.value = -1;
      });
    }}

  void toggleLike(int index) {
    if (isPostLiked[index]) {
      postLikes[index]--;
      isPostLiked[index] = false;
    } else {
      postLikes[index]++;
      if (isPostDisliked[index]) {
        postDislikes[index]--;
        isPostDisliked[index] = false;
      }
      isPostLiked[index] = true;
    }
  }



  Color avatarBorderColor(int index) {
    if (isLoading[index]) {
      return Colors.grey;
    }
    return clickedIndex.value == index ? Colors.grey : Colors.green;
  }

  void toggleDislike(int index) {
    if (isPostDisliked[index]) {
      postDislikes[index]--;
      isPostDisliked[index] = false;
    } else {
      postDislikes[index]++;
      if (isPostLiked[index]) {
        postLikes[index]--;
        isPostLiked[index] = false;
      }
      isPostDisliked[index] = true;
    }
  }
}
