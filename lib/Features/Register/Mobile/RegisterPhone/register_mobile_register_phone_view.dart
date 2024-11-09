import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:GreenWave/Features/MainWrapper/MainWrapperBottomNav/main_wrapper_bottom_nav_view.dart';
import 'package:GreenWave/Features/Register/Mobile/RegisterPhone/register_mobile_register_phone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../Core/Gen/assets.gen.dart';

class RegisterMobileRegisterPhoneView extends GetView<RegisterMobileRegisterPhoneViewmodel> {
  const RegisterMobileRegisterPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(Assets.json.wave2, height: 250),
            SingleChildScrollView(
              padding:
              EdgeInsets.symmetric(horizontal: width < 900 ? 24.0 : 240.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: Text(
                      'send your message!',
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
                    height: 45,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      cursorColor: Colors.grey.shade600,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade500),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Enter Code',
                      ),
                      onChanged: (value) => controller.email.value = value,
                    ),
                  ),

                  const SizedBox(height: 40.0),
                  Center(
                    child: SizedBox(
                        width: width * 1.5,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.monopolyColor2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Get.offAll(MainWrapperBottomNavView());
                          },
                          child: Text(
                            'Next',
                            style: textTheme.bodyMedium!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                  ),





                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
