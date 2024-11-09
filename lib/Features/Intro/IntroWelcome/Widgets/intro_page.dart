import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const IntroPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    /// get device size
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Container for the image
          Container(
            width: width,
            height: height * 0.6,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(70),
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // سایه ملایم
                  blurRadius: 10,
                  spreadRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(70),
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: DelayedWidget(
                delayDuration: const Duration(milliseconds: 200),
                // Not required
                animationDuration: const Duration(seconds: 1),
                // Not required
                animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                //
                child: Image.asset(image,
                    fit: BoxFit.cover), // استفاده از BoxFit برای تناسب تصویر
              ),
            ),
          ),

          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: DelayedWidget(
              delayDuration: const Duration(milliseconds: 400), // Not required
              animationDuration: const Duration(seconds: 1), // Not required
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM, // Not required
              child: Text(title, style: textTheme.titleMedium),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: DelayedWidget(
                delayDuration: const Duration(milliseconds: 600),
                // Not required
                animationDuration: const Duration(seconds: 1),
                // Not required
                animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                // Not required
                child: Text(description, style: textTheme.bodyMedium)),
          ),
        ],
      ),
    );
  }
}
