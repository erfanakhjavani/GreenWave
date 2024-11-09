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
          // PageView positioned in the full screen
          Positioned.fill(
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

          // Animated Positioned for the button
          Obx(
            () => Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: EdgeInsets.only(bottom: height / 20),
                child: GetStartBtn(
                  text: controller.showGetStart.value ? "Let's go" : 'Next',
                  onTap: () {
                    if (controller.showGetStart.value) {
                      Get.offAll(const IntroMainView());
                    } else {
                      controller.nextPage();
                    }
                  },
                ),
              ),
            ),
          ),

          // SmoothPageIndicator centered horizontally and positioned at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: height / 7),
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
          ),
        ],
      ),
    );
  }
}
