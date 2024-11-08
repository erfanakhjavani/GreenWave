import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../../Core/Gen/assets.gen.dart';
import '../../../Register/RegisterSwitch/register_switch_view.dart';
import '../main_wrapper_home_viewmodel.dart';


class DialogForSendImage extends GetView<MainWrapperHomeViewmodel> {
  const DialogForSendImage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Column(
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
                Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: Assets.jpg.intro1.provider(),fit: BoxFit.cover),
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(
                            10)),
                    width: width / 3 - 50,
                    height: width / 3 - 50,
                ),
                const Icon(Icons.check_circle_rounded,size: 40,),
                Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: Assets.jpg.intro2.provider(),fit: BoxFit.cover),                          borderRadius: BorderRadius.circular(
                            10)),
                    width: width / 3 - 50,
                    height: width / 3 - 50,
                ),
              ],
            ),
          ),
          const Gap(15),
          const Icon(Icons.arrow_upward,color: Colors.green,),
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
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(
                            10)),
                    width: width / 3 - 50,
                    height: width / 3 - 50,
                    child:   const Stack(
                      children: [
                        Center(child: FaIcon(FontAwesomeIcons.seedling,size: 35,)),
                        Positioned.fill(
                            top: 20,
                            left: 25,
                            child: Icon(Icons.add,size: 25,)),
                      ],
                    )
                ),
                IconButton(onPressed: (){},
                    style: IconButton.styleFrom(backgroundColor: AppColors.monopolyColor1),
                    icon: const Icon(
                        FontAwesomeIcons.arrowUpFromBracket
                    )),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(
                            10)),
                    width: width / 3 - 50,
                    height: width / 3 - 50,
                    child:   const Stack(
                      children: [
                        Center(child: FaIcon(FontAwesomeIcons.seedling,size: 35,)),
                        Positioned.fill(
                            top: 20,
                            left: 25,
                            child: Icon(Icons.add,size: 25,)),
                      ],
                    )
                ),

              ],
            ),
          ),
          const Gap(20),
          SizedBox(
              width: 100,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.monopolyColor2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Get.to(const RegisterSwitchView());
                },
                child: Text('done',
                  style: textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
                  ,),
              )),
        ],
      ),
    );
  }
}



