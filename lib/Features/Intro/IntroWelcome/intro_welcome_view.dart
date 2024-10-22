import 'package:GreenWave/Features/Intro/IntroMain/intro_main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Widgets/get_start_btn.dart';
import 'Widgets/intro_page.dart';
import 'intro_welcome_viewmodel.dart';

class IntroWelcomeView extends GetView<IntroWelcomeViewmodel> {
  const IntroWelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: height / 100,
            top: 0,
            child: SizedBox(
              width: width,
              height: height,
              child: PageView.builder(
                onPageChanged: controller.onPageChanged,
                controller: controller.pageController,
                itemCount: controller.introPages.length,
                itemBuilder: (context, index) {
                  var page = controller.introPages[index];
                  return IntroPage(
                    title: page.title,
                    description: page.description,
                    image: page.image,
                  );
                },
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              bottom: height / 20,
              left: controller.showGetStart.value ? width / 3.5 : width / 2.85,
              right: controller.showGetStart.value ? width / 3.5 : width / 2.85,
              
              duration: const Duration(milliseconds: 250),
              child: controller.showGetStart.value
                  ? GetStartBtn(
                      text: "Let's go",
                      onTap: () {
                        Get.offAll(const IntroMainView());
                      },
                    )
                  : GetStartBtn(
                      text: 'Next',
                      onTap: () {
                        controller.nextPage();
                      },
                    ),
            ),
          ),
          Positioned(
            bottom: height / 7,
            left: width / 2.2,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: controller.introPages.length,
              effect: const WormEffect(
                dotWidth: 10,
                dotHeight: 10,
                spacing: 5,
                activeDotColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
