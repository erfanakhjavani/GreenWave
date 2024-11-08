import 'dart:io';
import 'dart:math';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ChoiceImage extends GetxController{

  late File uploadImage;
  String fileName = "";
  bool load = false;


  Future<void> chooseImageC() async {
    final choiceImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (choiceImage == null) return;

    final imageTemp = File(choiceImage.path);

    Random random = Random();
    int randomNumber = random.nextInt(100000);



    uploadImage = imageTemp;
    fileName = "image_$randomNumber.jpg";
    print("your file name is =$fileName");
    load = true;
    update();

  }
  Future<void> chooseImageG() async {
    final choiceImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (choiceImage == null) return;

    final imageTemp = File(choiceImage.path);

    Random random = Random();
    int randomNumber = random.nextInt(100000);



    this.uploadImage = imageTemp;
    fileName = "image_$randomNumber.jpg";
    print("your file name is =$fileName");
    load = true;
    update();
  }
}