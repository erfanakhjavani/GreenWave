import 'dart:convert';
import 'dart:io';
import 'package:GreenWave/Core/Data/Repositories/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Core/Services/choice_image.dart';
import '../../../Core/Data/Repositories/image_repository.dart';
import '../../../Core/Services/response_model.dart';
import 'dialog_model.dart';

class DialogController extends GetxController {
  final ChoiceImage choiceImage = ChoiceImage();
  final ImageRepository imageRepository = ImageRepository();

  var selectedImage1 = Rx<File?>(null);
  var selectedImage2 = Rx<File?>(null);
  var showImageDialog = true.obs;
  var selectedCode = (-1).obs;
  var step = 1.obs;
  var isSelectedContainer = false.obs;
  var codeRD = ''.obs;
  var state = ResponseModel<String>.loading("Uploading...").obs;
  var steps = <ChoiceResponse>[].obs;


  @override
  void onInit() {
    getChoicesStep();
    super.onInit();
  }

  @override
  void dispose() {
    getChoicesStep();
    super.dispose();
  }

  void selectContainer(int code) {
    selectedCode.value = code;
  }

  Color getContainerColor(int code) {
    return selectedCode.value == code ? Colors.green : Colors.blue;
  }

  String? _convertImageToBase64(File? imageFile) {
    return imageFile != null ? base64Encode(imageFile.readAsBytesSync()) : null;
  }

  Future<dynamic> getChoicesStep() async{
    state.value = ResponseModel.loading("getting...");
    showImageDialog.value ? step.value == 2 : 1;
    final data = {
      "stepNum": step.value,

    };
    final response = await imageRepository.getChoicesServer(data);
    print(response);
    steps.value = json.decode(response.data['data']);
    if(response.status == Status.COMPLETED){
      print(response);
      return steps;
    }
    print(response);
    return response.data;

  }




  Future<void> sendImagesToServer() async {
    state.value = ResponseModel.loading("Uploading...");
    codeRD.value = DataRepository().loadData('codeRD');

    final base64Image1 = _convertImageToBase64(selectedImage1.value);
    final base64Image2 = _convertImageToBase64(selectedImage2.value);

    if (base64Image1 == null || base64Image2 == null) {
      state.value = ResponseModel.error("Please select both images.");
      return;
    }

    final data = {
      "image1": base64Image1,
      "image2": base64Image2,
      "codeDevice": codeRD.value,
    };

    final response = await imageRepository.uploadImages(data);
    state.value =  ResponseModel.completed("Images uploaded successfully: $response");
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
