import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SouvenirItem extends StatelessWidget {
  final String image, title;
  const SouvenirItem({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.contain,
              width: 200.0,
              height: 200.0,
              placeholder: (context, url) => SizedBox(
                  width: 40,
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor)),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: AppColors.primaryColor),
            ),
          ),
          Container(
            color: AppColors.primaryColor,
            width: double.infinity,
            height: 50.0,
            child: Center(
              child: Text(
                title, 
                textAlign: TextAlign.center,
                style: AppTextStyles.pacifico40064.copyWith(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
