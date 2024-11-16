import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Services/response_model.dart';
import '../Repository/dialog_repository.dart';
import 'dialog_choice_item_model.dart';

class DialogChoiceItemViewmodel extends GetxController {
  var step = 0.obs;
  var stepsList = <DialogChoiceItemModel>[].obs;
  var isSelectedContainer = false.obs;

  Rx<ResponseModel> state = ResponseModel.error('Nothing...').obs;
  final DialogRepository _dialogRepository = DialogRepository();

  @override
  void onInit() {
    getChoicesStep();
    super.onInit();
  }

  @override
  void dispose() {
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
      "stepNum": 1,
    };

    final response = await _dialogRepository.getChoicesStep(data);
    if (response.status == Status.COMPLETED) {
      stepsList.value = (response.data as List)
          .map((item) => DialogChoiceItemModel.fromJson(item as Map<String, dynamic>))
          .toList();
      state.value = ResponseModel.completed("Data loaded successfully");
    } else {
      state.value = ResponseModel.error("Unexpected data format: expected a list.");
    }
  }
}