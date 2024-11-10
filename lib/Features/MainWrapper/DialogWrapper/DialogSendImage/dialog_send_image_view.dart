import 'dart:io';

import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../Core/Gen/assets.gen.dart';
import '../../../../Core/Services/response_model.dart';
import '../../../../Core/Widgets/animate_switch.dart';
import '../Ui_helpers/bottom_sheet_choice_image.dart';
import 'dialog_send_image_viewmodel.dart';

class DialogSendImageView extends GetView<DialogSendImageViewmodel> {
  const DialogSendImageView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _defaultImageContainer(width, Assets.jpg.intro1.provider()),
              const Icon(Icons.check_circle_rounded, size: 40),
              _defaultImageContainer(width, Assets.jpg.intro2.provider()),
            ],
          ),
        ),
        const Gap(15),
        const Icon(Icons.arrow_upward, color: Colors.green),
        Column(
          children: List.generate(
            3,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Container(
                width: 2,
                height: 8,
                color: Colors.green,
              ),
            ),
          ),
        ),
        const Gap(10),
        Container(
          width: width,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Image container for the first selected image
              Obx(() => _imageContainer(
                    imageFile: controller.selectedImage1.value,
                    onImageSelected: () async {
                      await controller.selectImageFromGallery(1);
                    },
                    context: context,
                  )),
              Obx(
                () => IconButton(
                  onPressed: () async {
                    await controller.sendImagesToServer();
                  },
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.monopolyColor1,
                  ),
                  icon: AnimatedCrossFade(
                    crossFadeState:
                        controller.state.value.status == Status.LOADING
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 500),
                    firstChild:
                         controller.state.value.status == Status.COMPLETED
                         ? const Icon(Icons.check_circle_rounded, size: 30)
                          : const Icon(FontAwesomeIcons.arrowUpFromBracket),
                    secondChild: Center(
                      child: LoadingAnimationWidget.dotsTriangle(color: AppColors.secondary,
                          size: 20),
                    ),
                  ),
                ),
              ),
              Obx(() => _imageContainer(
                    imageFile: controller.selectedImage2.value,
                    onImageSelected: () async {
                      await controller.selectImageFromGallery(2);
                    },
                    context: context,
                  )),
            ],
          ),
        ),
        const Gap(20),
        Obx(
          () => SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.monopolyColor2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: controller.state.value.status == Status.COMPLETED
                  ? () {
                      Get.to(const RegisterSwitchView());
                    }
                  : null,
              child: Text(
                'Done',
                style: textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _defaultImageContainer(double width, ImageProvider<Object> image) {
    return Container(
      width: width / 3 - 50,
      height: width / 3 - 50,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _imageContainer({
    required BuildContext context,
    File? imageFile,
    required VoidCallback onImageSelected,
  }) {
    return GestureDetector(
      onTap: () {
        bottomSheetChoiceImage(
          onTapG: onImageSelected,
          onTapC: () async {
            await controller.selectImageFromCamera(
                controller.selectedImage1.value == null ? 1 : 2);
            Get.back();
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          image: imageFile != null
              ? DecorationImage(image: FileImage(imageFile), fit: BoxFit.cover)
              : null,
        ),
        width: MediaQuery.sizeOf(context).width / 3 - 50,
        height: MediaQuery.sizeOf(context).width / 3 - 50,
        child: imageFile == null
            ? const Stack(
                children: [
                  Center(
                      child: FaIcon(
                    FontAwesomeIcons.seedling,
                    size: 35,
                  )),
                  Positioned.fill(
                    top: 20,
                    left: 25,
                    child: Icon(
                      Icons.add,
                      size: 25,
                    ),
                  ),
                ],
              )
            : null,
      ),
    );
  }
}
