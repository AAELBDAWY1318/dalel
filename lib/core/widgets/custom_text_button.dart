import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const CustomTextButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text, 
        style: AppTextStyles.poppins50024.copyWith(
          fontWeight: FontWeight.w200, 
          fontSize: 16.0, 
        ),
      ),
    );
  }
}