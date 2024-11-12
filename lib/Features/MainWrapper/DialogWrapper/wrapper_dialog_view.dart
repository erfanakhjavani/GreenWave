import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../Core/Gen/assets.gen.dart';
import '../../../Core/Widgets/animate_switch.dart';
import 'wrapper_dialog_viewmodel.dart';


class WrapperDialogView extends  GetView<WrapperDialogViewmodel>{
  const WrapperDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return PopScope(
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
                            automaticallyImplyLeading: false,
                          ),
                          Center(
                              child: Lottie.asset(Assets.json.env1,
                                  width: 150, height: 150)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      child: Text(
                        "Please select to begin",
                        style: textTheme.headlineSmall,
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                        child: Text(
                          "The first stage of registration is done by sending two photos of what you do to the environment.",
                          style: textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const Gap(10),
                     const SwitcherDialog(),

                  ],
                ),
              )),
        ),
      ),
    );
  }
}

void showWrapperDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const WrapperDialogView();
    },
  );
}
