import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Core/Gen/assets.gen.dart';
import '../../../Core/UI Helper/show_modal_bottom_sheet.dart';

class MainWrapperQuestView extends StatelessWidget {
  const MainWrapperQuestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: (){
            showCustomModalBottomSheet(
              imagePath: Assets.png.google.path,
              description: 'this is description test',
              buttonText: 'تایید',
              onButtonPressed: () {
                Get.back();
              },
            );
          },
          child: const Text('Quest')),

    );
  }
}
