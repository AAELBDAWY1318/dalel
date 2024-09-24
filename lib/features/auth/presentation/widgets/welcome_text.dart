import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        child: Text(
      AppStrings.welcome,
      style: AppTextStyles.poppins50024.copyWith(
        fontSize: 28.0,
      ),
    ));
  }
}
