import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomItemOverview extends StatelessWidget {
  final String image, title;
  const CustomItemOverview(
      {super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 90,
      height: 133,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightGrey,
              blurRadius: 10.0,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            height: 96,
            width: 90,
          ),
          const SizedBox(height: 11),
          Text(
            title,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.poppins50016.copyWith(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
