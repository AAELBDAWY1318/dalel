import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomActionItem extends StatelessWidget {
  final Map<String, dynamic> data;
  const CustomActionItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: data["function"],
        child: Row(
          children: [
            Icon(
              data["icon"],
              color: AppColors.deepBrown,
              size: 30.0,
            ),
            const SizedBox(width: 20.0),
            Text(
              data["text"],
              style: AppTextStyles.font18500.copyWith(fontSize: 16.0),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.deepBrown,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
