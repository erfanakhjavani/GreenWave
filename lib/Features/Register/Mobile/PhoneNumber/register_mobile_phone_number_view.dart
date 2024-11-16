import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Features/Register/Mobile/PhoneNumber/register_mobile_phone_number_viewmodel.dart';
import 'package:GreenWave/Features/Register/Mobile/RegisterPhone/register_mobile_register_phone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../../Core/Gen/assets.gen.dart';
import '../../../../Core/Services/response_model.dart';

class RegisterMobileView extends StatelessWidget {
  RegisterMobileView({super.key});

  final RegisterMobileViewmodel controller = RegisterMobileViewmodel();
  final TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(Assets.json.waveloop, height: 250),
            SingleChildScrollView(
              padding:
              EdgeInsets.symmetric(horizontal: width < 900 ? 24.0 : 240.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Text(
                      'Welcome to GreenWave!',
                      style: textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 30.0),
                    child:
                    Text('Enter your Credentials to access your account'),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: width * 1.5,
                    height: 70,
                    child: TextField(
                      maxLength: 15,
                      cursorColor: Colors.grey.shade600,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter phone Number',
                      ),
                      onChanged: (value) => number.text = value,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                        activeColor: AppColors.monopolyColor1,
                        value: controller.rememberMe.value,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        onChanged: (value) => controller.toggleRememberMe(),
                      )),
                      const Text('Remember me on device'),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Center(
                    child: SizedBox(
                        width: width * 1.5,
                        height: 40,
                        child: Obx(() => ElevatedButton(
                            onPressed:  () async{
                              await controller.postNumber(number.text);
                              if(controller.state.value.status == Status.COMPLETED){
                               await Get.find<RegisterMobileRegisterPhoneViewmodel>().checkStatus(number.text);
                                controller.changePage();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor:
                              const Color.fromRGBO(42, 101, 51, 1.0),
                            ),
                            child: AnimatedCrossFade(
                              firstChild:  Text(
                                'Next',
                                style: textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              secondChild: LoadingAnimationWidget.dotsTriangle(
                                  color: AppColors.secondary, size: 20),
                              crossFadeState: controller.state.value.status == Status.LOADING
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 300),
                            ),)
                        ),),
                  ),
                  const SizedBox(height: 25.0),
                  Row(
                    children: [
                      const Expanded(child: Divider()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Or', style: textTheme.labelLarge),
                      ),
                      const Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 25.0),

                        Center(
                          child: ElevatedButton.icon(
                          onPressed: controller.signInWithTelegram,
                          icon: const Icon(
                            Icons.telegram,
                            size: 40,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Sign in with Telegram',
                            style: TextStyle(color: AppColors.secondary),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                                                ),
                        )


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
