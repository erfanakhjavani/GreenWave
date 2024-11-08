import 'package:flutter/material.dart';

class ShowTooltip extends StatelessWidget{
  final String tooltipText;

  const ShowTooltip({super.key, required this.tooltipText});

  @override
  Widget build(BuildContext context) {
    return SnackBar(
        content: Text(tooltipText),);
  }

}