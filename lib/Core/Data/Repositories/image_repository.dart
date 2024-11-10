import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Services/response_model.dart';
import 'Base/base_repository.dart';

class ImageRepository extends BaseRepository {
  Future<ResponseModel> uploadImages(Map<String, dynamic> data) async {
    return await postRequest(AddressKey.uploadImage, data,);
  }

  Future<ResponseModel> getChoicesServer(Map<String, dynamic> data) async {
    return await postRequest(AddressKey.getChoices, data,);
  }
}




