import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Services/response_model.dart';
import '../../../../Core/Data/Repositories/base_repository.dart';

class DialogRepository extends BaseRepository {


  //! step 1: Choices subject image
  Future<ResponseModel> getChoicesStep(Map<String, dynamic> data) async {
    return await postRequest(AddressKey.choicesSubject, data);
  }

  //! step 2: Upload image after choice subject
  Future<ResponseModel> uploadImages(Map<String, dynamic> data) async {
    return await postRequest(AddressKey.uploadImage, data,);
  }

}




