import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'dialog_controller.dart';

class DialogForChoiceTypeImage extends GetView<DialogController> {
  const DialogForChoiceTypeImage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: List.generate(
            controller.steps.length,
            (index) {
              int containerCode = index + 1;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: GestureDetector(
                  onTap: () {
                    controller.isSelectedContainer.value = true;
                    controller.selectContainer(containerCode);
                  },
                  child: Obx(() => Container(
                        width: width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: controller.getContainerColor(containerCode),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      )),
                ),
              );
            },
          ),
        ),
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
                      controller.showImageDialog.value = false;
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
