import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/UI%20Helper/show_snack_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../Repository/dialog_repository.dart';
import '../../../../Core/Data/Repositories/storage_repository.dart';
import '../../../../Core/Services/choice_image.dart';
import '../../../../Core/Services/response_model.dart';

class DialogSendImageViewmodel extends GetxController{
  final ChoiceImage choiceImage = ChoiceImage();
  final DialogRepository imageRepository = DialogRepository();

  var selectedImage1 = Rx<File?>(null);
  var selectedImage2 = Rx<File?>(null);

  Rx<ResponseModel> state = ResponseModel.error('Nothing...').obs;




  String? _convertImageToBase64(File? imageFile) {
    return imageFile != null ? base64Encode(imageFile.readAsBytesSync()) : null;
  }


  Future<void> sendImagesToServer() async {
    state.value = ResponseModel.loading("Uploading...");



    final base64Image1 = _convertImageToBase64(selectedImage1.value);
    final base64Image2 = _convertImageToBase64(selectedImage2.value);

    if (base64Image1 == null || base64Image2 == null) {
      showCustomSnackBar('Alarm', "Please select both images.");
      state.value = ResponseModel.error("Please select both images.");
      return;
    }

    final data = {
      "image1": base64Image1,
      "image2": base64Image2,
    };

    final response = await imageRepository.uploadImages(data);

    if (response.status == Status.COMPLETED) {
      state.value =  ResponseModel.completed(response.data);
    } else {
      showCustomSnackBar('Error', "Failed to upload image.");
      state.value = ResponseModel.error(response.message);
    }

  }

  Future<void> _selectImage(int imageNumber, Future<void> Function() chooseImage) async {
    await chooseImage();
    if (imageNumber == 1) {
      selectedImage1.value = choiceImage.uploadImage;
    } else {

      selectedImage2.value = choiceImage.uploadImage;
    }
  }

  Future<void> selectImageFromCamera(int imageNumber) async {
    await _selectImage(imageNumber, choiceImage.chooseImageC);
  }

  Future<void> selectImageFromGallery(int imageNumber) async {
    await _selectImage(imageNumber, choiceImage.chooseImageG);
  }
}