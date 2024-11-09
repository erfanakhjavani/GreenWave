import 'dart:convert';
import 'dart:io';
import 'package:GreenWave/Core/Data/Repositories/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Services/choice_image.dart';
import '../../../Core/Data/Repositories/image_repository.dart';
import '../../../Core/Services/response_model.dart';

class DialogController extends GetxController {
  final ChoiceImage choiceImage = ChoiceImage();
  final ImageRepository imageRepository = ImageRepository();
  var selectedImage1 = Rx<File?>(null);
  var selectedImage2 = Rx<File?>(null);
  var showImageDialog = true.obs;
  var selectedCode = (-1).obs;
  var isSelectedContainer = false.obs;
  var codeRD = ''.obs;
  var imageUploadStatus = ResponseModel<String>.loading("Uploading...").obs;





  void selectContainer(int code) {
    selectedCode.value = code;
  }

  Color getContainerColor(int code) {
    return selectedCode.value == code ? Colors.green : Colors.blue;
  }

  String? _convertImageToBase64(File? imageFile) {
    if (imageFile != null) {
      return base64Encode(imageFile.readAsBytesSync());
    }
    return null;
  }

  Future<void> sendImagesToServer() async {
    imageUploadStatus.value = ResponseModel.loading("Uploading...");
    codeRD.value = DataRepository().loadData('codeRD');
    String? base64Image1 = _convertImageToBase64(selectedImage1.value);
    String? base64Image2 = _convertImageToBase64(selectedImage2.value);

    if (base64Image1 == null || base64Image2 == null) {
      imageUploadStatus.value = ResponseModel.error("Please select both images.");
      return;
    }

    Map<String, dynamic> data = {
      "image1": base64Image1,
      "image2": base64Image2,
      "codeDevice": codeRD.value,
    };

    try {
      await ImageRepository().uploadImages(data);
      imageUploadStatus.value = ResponseModel.completed("Images uploaded successfully.");
    } catch (e) {
      imageUploadStatus.value = ResponseModel.error("Error uploading images: $e");
    }
  }

  Future<void> selectImageFromCamera(int imageNumber) async {
    await choiceImage.chooseImageC();
    if (imageNumber == 1) {
      selectedImage1.value = choiceImage.uploadImage;
    } else {
      selectedImage2.value = choiceImage.uploadImage;
    }
  }

  Future<void> selectImageFromGallery(int imageNumber) async {
    await choiceImage.chooseImageG();
    if (imageNumber == 1) {
      selectedImage1.value = choiceImage.uploadImage;
    } else {
      selectedImage2.value = choiceImage.uploadImage;
    }
  }
}
