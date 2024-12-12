import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCartWidget extends StatelessWidget {
  const CustomCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Image.asset(
            Assets.assetsImagesScreenshot,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Text(
            "My Credit Card",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: AppColors.deepBrown,
            ),
          ),
        ],
      ),
    );
  }
}
