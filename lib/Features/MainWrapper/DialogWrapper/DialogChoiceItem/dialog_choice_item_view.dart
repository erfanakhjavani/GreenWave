import 'package:GreenWave/Core/Constants/address_key.dart';
import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Features/MainWrapper/DialogWrapper/wrapper_dialog_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../Core/Data/Repositories/storage_repository.dart';
import '../../../../Core/Services/response_model.dart';
import 'dialog_choice_item_viewmodel.dart';

class DialogChoiceItemView extends GetView<DialogChoiceItemViewmodel> {
  const DialogChoiceItemView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Obx(
          () {
            switch(controller.state.value.status){
              case Status.LOADING:
                return SizedBox(
                  width: width,
                  height: 300,
                  child: Center(
                    child: LoadingAnimationWidget.inkDrop(color: AppColors.monopolyColor1,
                        size: 30),
                  ),
                );
              case Status.COMPLETED:
                return Column(
                  children: List.generate(
                    controller.stepsList.length,
                        (index) {
                      int containerCode = index + 1;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.isSelectedContainer.value = true;
                            controller.selectContainer(containerCode);
                          },
                          child: Obx(() =>
                              Container(
                                width: width,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: controller.getContainerColor(
                                      containerCode),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text('${controller.stepsList[index].step}: ',
                                        style: TextStyle(
                                            color: AppColors.secondary),),
                                      Text(controller.stepsList[index].title,
                                        style: TextStyle(
                                            color: AppColors.secondary),),

                                    ],
                                  ),
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                );
             case Status.ERROR:
                return SizedBox(
                  width: width,
                  height: height / 2,
                  child: const Center(
                    child: Text('No steps found'),
                  ),
                );
                default:
                  return Container();
            }
          } ),
        const Gap(20),
        Obx(() => SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.monopolyColor2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: controller.isSelectedContainer.value
                  ? () {
                      DataRepository().saveData(AddressKeyStorage.stepNum, controller.step.value);
                      Get.find<WrapperDialogViewmodel>().showImageDialog.value =
                          false;
                    }
                  : null,
              child: Text(
                'Next',
                style: textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )))
      ],
    );
  }
}
