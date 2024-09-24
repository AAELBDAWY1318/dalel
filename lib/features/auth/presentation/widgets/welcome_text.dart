import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  final Color? color;
  final String? text;
  const WelcomeText({super.key, this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Text(
      text ?? AppStrings.welcome,
      style: AppTextStyles.poppins50024.copyWith(
        fontSize: 28.0,
        color: color ?? AppColors.black,
      ),
    ));
  }
}
