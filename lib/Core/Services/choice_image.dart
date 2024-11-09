import 'dart:io';
import 'dart:math';

import 'package:image_picker/image_picker.dart';

class ChoiceImage {
  late File uploadImage;

  Future<void> chooseImageC() async {
    final choiceImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (choiceImage == null) return;

    final imageTemp = File(choiceImage.path);

    Random random = Random();
    int randomNumber = random.nextInt(100000);

    uploadImage = imageTemp;
  }

  Future<void> chooseImageG() async {
    final choiceImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (choiceImage == null) return;

    final imageTemp = File(choiceImage.path);

    Random random = Random();
    int randomNumber = random.nextInt(100000);

    uploadImage = imageTemp;
  }
}
