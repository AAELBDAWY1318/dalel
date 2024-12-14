import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final String text;
  const LoadingWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.pacifico40064.copyWith(fontSize: 20.0),
        ),
        const SizedBox(
          height: 15.0,
        ),
        CircularProgressIndicator(
          color: AppColors.deepBrown,
        )
      ],
    );
    ;
  }
}
