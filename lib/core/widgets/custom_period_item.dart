import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomPeriodContainer extends StatelessWidget {
  final Function()? onTap;
  final String image;
  final String text;
  const CustomPeriodContainer({super.key, this.onTap, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 164,
        height: 96,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
              color: AppColors.lightGrey,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 64,
              height: 48,
              child: Text(
                text,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.poppins50016,
              ),
            ),
            const SizedBox(width:15.0 ),
            SizedBox(
              height: 64,
              width: 47,
              child: Image.asset(
                image, 
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}