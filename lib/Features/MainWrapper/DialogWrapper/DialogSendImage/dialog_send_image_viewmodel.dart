import 'dart:convert';


import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import '../../../../Core/UIHelper/show_snack_bar.dart';
import '../Repository/dialog_repository.dart';
import '../../../../Core/Services/choice_image.dart';
import '../../../../Core/Services/response_model.dart';

class DialogSendImageViewmodel extends GetxController {
  final ChoiceImage choiceImage = ChoiceImage();
  final DialogRepository imageRepository = DialogRepository();

  var selectedImage1 = Rx<String?>(null); // Stores the base64 string or file path.
  var selectedImage2 = Rx<String?>(null);

  Rx<ResponseModel> state = ResponseModel.error('Nothing...').obs;

  Future<void> sendImagesToServer() async {
    state.value = ResponseModel.loading("Uploading...");

    try {
      if (selectedImage1.value == null || selectedImage2.value == null) {
        showCustomSnackBar('Alarm', "Please select both images.");
        state.value = ResponseModel.error("Please select both images.");
        return;
      }

      final data = {
        "image1": selectedImage1.value,
        "image2": selectedImage2.value,
      };



      final response = await imageRepository.uploadImages(data);

      if (response.status == Status.COMPLETED) {
        state.value = ResponseModel.completed(response);
      } else {
        print(response.message);
        showCustomSnackBar('Error', response.message);
        state.value = ResponseModel.error(response.message);
      }
    } catch (e) {
      showCustomSnackBar('Error', "An unexpected error occurred.");
      state.value = ResponseModel.error("Unexpected error: $e");
    }
  }

  Future<void> _selectImage(
      int imageNumber, Future<void> Function() chooseImage) async {
    await chooseImage();
    final base64Image = base64Encode(await choiceImage.uploadImage.readAsBytes());
    if (imageNumber == 1) {
      selectedImage1.value = base64Image;
    } else {
      selectedImage2.value = base64Image;
    }
    }

  Future<void> selectImageFromCamera(int imageNumber) async {
    await _selectImage(imageNumber, choiceImage.chooseImageC);
  }

  Future<void> selectImageFromGallery(int imageNumber) async {
    await _selectImage(imageNumber, choiceImage.chooseImageG);
  }
}
