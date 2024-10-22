import 'package:GreenWave/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';

class GetStartBtn extends StatelessWidget {
  final String text;
  final Function onTap;

  const GetStartBtn({Key? key, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return SizedBox(
      height: 50,
      width: width / 3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
