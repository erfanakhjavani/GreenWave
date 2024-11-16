import 'package:GreenWave/Core/Constants/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../Core/Constants/app_colors.dart';
import '../../../Core/Gen/assets.gen.dart';
import '../../../Core/Services/response_model.dart';
import 'intro_splash_viewmodel.dart';

class IntroSplashView extends GetView<IntroSplashViewmodel> {
  const IntroSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(color: AppColors.monopolyColor2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Assets.png.logo.image(
                    fit: BoxFit.cover,
                    width: width * 0.6,
                    height: height * 0.6,
                  ),
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (controller.state.value.status == Status.COMPLETED) {
                    Future.delayed(const Duration(seconds: 1), () {
                      Get.offAllNamed(AppRoute.introWelcomeView);
                    });
                    return Text(
                      'For better life...',
                      style: textTheme.bodyLarge!.copyWith(color: Colors.white),
                    );
                  } else if (controller.state.value.status == Status.ERROR) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                          child: Text(
                            'Please check your connection!',
                            style: textTheme.bodyLarge!
                                .copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.checkConnection();
                          },
                          icon: Icon(
                            Icons.refresh,
                            color: AppColors.secondary,
                            size: width * 0.08,
                          ),
                        ),
                      ],
                    );
                  } else if (controller.state.value.status == Status.LOADING) {
                    return Center(
                      child: LoadingAnimationWidget.bouncingBall(
                        color: Colors.white,
                        size: width * 0.1,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
