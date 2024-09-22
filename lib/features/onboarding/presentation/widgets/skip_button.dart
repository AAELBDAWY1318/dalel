import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final Function() onTap;
  const SkipButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            AppStrings.skip,
            style: AppTextStyles.poppins50024.copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ));
  }
}
