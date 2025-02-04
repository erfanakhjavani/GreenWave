import 'package:flutter/material.dart';
import 'package:get/get.dart';

void bottomSheetChoiceImage({
  required final Function() onTapG,
  required final Function() onTapC,
}) {
  Get.bottomSheet(
    Container(
      color: Colors.white,
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Gallery'),
            onTap: onTapG

          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: onTapC

          )
        ],
      ),
    ),
  );
}
