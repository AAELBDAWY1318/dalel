import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomItemOverview extends StatelessWidget {
  final String image, title;
  final Function() onTap;
  const CustomItemOverview(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            SizedBox(
              width: 90,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    SizedBox(width: 40, child: CircularProgressIndicator(color: AppColors.primaryColor)),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.poppins50016.copyWith(
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
