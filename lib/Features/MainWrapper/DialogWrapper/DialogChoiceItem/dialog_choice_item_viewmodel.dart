import 'package:GreenWave/Core/Data/Repositories/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Services/response_model.dart';
import '../Repository/dialog_repository.dart';
import 'dialog_choice_item_model.dart';


class DialogChoiceItemViewmodel extends GetxController {
  var step = 0.obs;
  var stepsList = <DialogChoiceItemModel>[].obs;
  var isSelectedContainer = false.obs;

  Rx<ResponseModel> state = ResponseModel.loading('Loading...').obs;
  final DialogRepository _dialogRepository = DialogRepository();

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
    step.value = code;
  }

  Color getContainerColor(int code) {
    return step.value == code ? Colors.green : Colors.blue;
  }

  Future<void> getChoicesStep() async {
    state.value = ResponseModel.loading("Getting choices...");
    final data = {
      "stepNum": step.value,
    };
    DataRepository().saveData('stepNum', step.value);

    final response = await _dialogRepository.getChoicesStep(data);
    if (response.status == Status.COMPLETED) {
      if (response.data['data'] is List) {
        stepsList.value = (response.data['data'] as List)
            .map((item) => DialogChoiceItemModel.fromJson(item))
            .toList();
        print(response.data);
        state.value = ResponseModel.completed("Data loaded successfully");
      } else {
        state.value = ResponseModel.error("Unexpected data format: expected a list.");
      }
    } else {
      state.value = ResponseModel.error(response.message);
    }
  }

}
