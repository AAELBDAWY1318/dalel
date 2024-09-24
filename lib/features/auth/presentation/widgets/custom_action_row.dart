import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomActionRow extends StatelessWidget {
  final String text1, text2;
  final Function() onTap;
  const CustomActionRow(
      {super.key,
      required this.text1,
      required this.text2,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
        ),
        TextButton(
            onPressed: onTap,
            child: Text(
              text2,
              style: TextStyle(
                fontSize: 14.0,
                color: AppColors.grey,
              ),
            )),
      ],
    );
  }
}
