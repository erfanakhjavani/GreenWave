import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../Core/Gen/assets.gen.dart';
import '../main_wrapper_home_viewmodel.dart';
import 'dialog_for_choice_type_image.dart';
import 'dialog_for_send_image.dart';

class SwitcherDialog extends GetView<MainWrapperHomeViewmodel> {
  const SwitcherDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return Obx(() => PopScope(
          canPop: true,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.3),
              child: Dialog(
                  insetPadding: const EdgeInsets.only(top: 30, bottom: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    width: width * 0.9,
                    child: Column(
                      children: [
                        Obx(
                          () => Stack(
                          children: [
                            AppBar(
                              elevation: 0,
                              toolbarHeight: 30,
                              leading: controller.showImageDialog.value == false
                                  ? IconButton(
                                  onPressed: () {
                                    controller.showImageDialog.value = true;
                                  },
                                  icon: const Icon(
                                      Icons.arrow_back_ios_new_rounded))
                                  : null,
                              automaticallyImplyLeading: false,
                            ),
                            Center(child: Lottie.asset(Assets.json.env1, width: 150, height: 150)),
                          ],
                        ),),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                          child: Text(
                            "Please select to begin",
                            style: textTheme.headlineSmall,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Text(
                              "The first stage of registration is done by sending two photos of what you do to the environment.",
                              style: textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const Gap(10),
                        PageTransitionSwitcher(
                          reverse: controller.showImageDialog.value,
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder: (Widget child,
                              Animation<double> primaryAnimation,
                              Animation<double> secondaryAnimation) {
                            return SharedAxisTransition(
                              animation: primaryAnimation,
                              secondaryAnimation: secondaryAnimation,
                              transitionType:
                                  SharedAxisTransitionType.horizontal,
                              child: child,
                            );
                          },
                          child: controller.showImageDialog.value
                              ? const DialogForChoiceTypeImage()
                              : const DialogForSendImage(),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ));
  }
}

void dialogForChoiceTypeImage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const SwitcherDialog();
    },
  );
}
