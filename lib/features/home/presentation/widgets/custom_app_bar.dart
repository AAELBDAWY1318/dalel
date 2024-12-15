import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.appName,
      textAlign: TextAlign.end,
      style: AppTextStyles.pacifico40064.copyWith(fontSize: 24.0),
    );
  }
}
