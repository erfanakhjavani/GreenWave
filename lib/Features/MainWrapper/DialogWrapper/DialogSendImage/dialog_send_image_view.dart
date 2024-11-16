import 'dart:convert';

import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Core/Constants/app_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../../Core/Gen/assets.gen.dart';
import '../../../../Core/Services/response_model.dart';
import '../Ui_helpers/bottom_sheet_choice_image.dart';
import 'dialog_send_image_viewmodel.dart';

class DialogSendImageView extends StatelessWidget{
   DialogSendImageView({super.key});

  final DialogSendImageViewmodel controller = DialogSendImageViewmodel();
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
            color: AppColors.monopolyColor1,
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
        Obx(() => Container(
          width: width,
          height: 120,
          decoration: BoxDecoration(
            color: controller.state.value.status == Status.COMPLETED
                ? AppColors.monopolyColor1
                : Colors.blue,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image container for the first selected image
              _imageContainer(
                imageBase64: controller.selectedImage1.value,
                onImageSelectedC: () async =>
                await controller.selectImageFromCamera(1),
                onImageSelectedG: () async =>
                await controller.selectImageFromGallery(1),
                context: context,
              ),
              SizedBox(
                width: 50,
                height: 60,
                child: IconButton(
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
                    firstChild: controller.state.value.status ==
                        Status.COMPLETED
                        ? const Icon(Icons.check_circle_rounded, size: 35)
                        : const Icon(
                      FontAwesomeIcons.arrowUpFromBracket,
                      size: 30,
                    ),
                    secondChild: LoadingAnimationWidget.bouncingBall(
                      color: AppColors.secondary,
                      size: 20,
                    ),
                    firstCurve: Curves.linearToEaseOut,
                    secondCurve: Curves.linearToEaseOut,
                  ),
                ),
              ),
              _imageContainer(
                imageBase64: controller.selectedImage2.value,
                onImageSelectedC: () async =>
                await controller.selectImageFromCamera(2),
                onImageSelectedG: () async =>
                await controller.selectImageFromGallery(2),
                context: context,
              ),
            ],
          ),
        )),
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
                Get.offAllNamed(AppRoute.mainWrapperBottomNavView);
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
    String? imageBase64,
    required VoidCallback onImageSelectedG,
    required VoidCallback onImageSelectedC,
  }) {
    return GestureDetector(
      onTap: () {
        bottomSheetChoiceImage(
          onTapG: onImageSelectedG,
          onTapC: onImageSelectedC,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10),
          image: imageBase64 != null
              ? DecorationImage(
            image: MemoryImage(base64Decode(imageBase64)),
            fit: BoxFit.cover,
          )
              : null,
        ),
        width: MediaQuery.sizeOf(context).width / 3 - 50,
        height: MediaQuery.sizeOf(context).width / 3 - 50,
        child: imageBase64 == null
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
