import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomErrorText extends StatelessWidget {
  final String text;
  const CustomErrorText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: AppTextStyles.poppins50016.copyWith(
          fontSize: 14.0,
          color: Colors.red,
        ),
      ),
    );
  }
}
