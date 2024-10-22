import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/cupertino.dart';

class DelayedWidgetWelcome extends StatelessWidget{
  const DelayedWidgetWelcome({super.key, required this.child});
  final Widget child;


  @override
  Widget build(BuildContext context) {
    return DelayedWidget(
     delayDuration: const Duration(milliseconds: 300), // Not required
      animationDuration: const Duration(seconds: 1), // Not required
      animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
      child: child, //
    );
  }

}