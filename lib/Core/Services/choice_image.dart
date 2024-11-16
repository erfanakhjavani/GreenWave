import 'package:image_picker/image_picker.dart';

class ChoiceImage {
  late XFile uploadImage;

  Future<void> chooseImageC() async {
    final choiceImage =
    await ImagePicker().pickImage(source: ImageSource.camera);

    if (choiceImage == null) return;

    uploadImage = choiceImage;
  }

  Future<void> chooseImageG() async {
    final choiceImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if (choiceImage == null) return;

    uploadImage = choiceImage;
  }
}
