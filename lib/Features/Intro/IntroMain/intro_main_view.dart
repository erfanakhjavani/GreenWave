import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Core/Gen/assets.gen.dart';
import '../../Register/Login/register_login_view.dart';
import '../../Register/RegisterSwitch/register_switch_view.dart';
import 'Widgets/bottom_wave_clipper.dart';
import 'Widgets/delayed_widget.dart';
import 'intro_main_viewmodel.dart';


class IntroMainView extends GetView<IntroMainViewmodel> {
  const IntroMainView({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipPath(
                    clipper: BottomWaveClipper(),
                    child: Container(
                      color: Colors.grey,
                      height: size.height * 0.35,
                      width: double.infinity,
                    ),
                  ),
                  const Positioned(
                    top: 100,
                    left: 20,
                    child: DelayedWidgetWelcome(
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: -22,
                        crossAxisAlignment: WrapCrossAlignment.end,
                        children: [
                          Text(
                            "GREEN",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4,
                            ),
                          ),
                          Text(
                            "Wave",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: size.width * 0.4,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () => _showLanguageSelection(context),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor:
                          const Color.fromRGBO(42, 101, 51, 1.0),
                        ),
                        child: const Text(
                          "ENGLISH",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    const Text(
                      "WELCOME",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(7, 121, 1, 1.0),
                        letterSpacing: 2,
                      ),
                    ),
                    const Text(
                      "Login to your account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "Hello, dear friend!",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromRGBO(7, 121, 1, 1.0),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "An exciting challenge has begun: by doing a small act for the environment, you can help create a better place to live! Every piece of trash you collect is a positive step for our future. Along with this good deed, valuable rewards await you! Let’s work together to build a more beautiful world!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),

                    // Checkbox و لینک Terms and Service
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => Checkbox(
                          value: controller.isTermsAccepted.value,
                          activeColor: Colors.green,
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            controller.isTermsAccepted.value = value!;
                          },
                        )),
                        const Text("I agree to the ",
                          style: TextStyle(color: Colors.black87,
                              fontSize: 12
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.snackbar('Terms', 'Link to terms and service.');
                          },
                          child: const Text(
                            "Terms and Service",
                            style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontSize: 12
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Obx(() => AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      width: controller.isTermsAccepted.value
                          ? size.width * 0.7 : size.width * 0.5 ,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: controller.isTermsAccepted.value
                            ? () => Get.offAll(RegisterSwitchView())
                            : null,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor:
                          const Color.fromRGBO(42, 101, 51, 1.0),
                        ),
                        child: const Text(
                          "START",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                    ),
                    SizedBox(
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                      child: SvgPicture.asset(
                        Assets.svg.logowt,
                        color: const Color.fromRGBO(42, 101, 51, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLanguageSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('English'),
              onTap: () {
                Get.back(); // برای بستن Bottom Sheet
                controller.changeLanguage('en');
              },
            ),
            ListTile(
              leading: const Icon(Icons.language),
              title: const Text('فارسی'),
              onTap: () {
                Get.back();
                controller.changeLanguage('fa');
              },
            ),
          ],
        );
      },
    );
  }
}