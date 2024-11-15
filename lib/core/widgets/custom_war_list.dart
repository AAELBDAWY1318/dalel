import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomWarItem extends StatelessWidget {
  final List wars;
  const CustomWarItem({super.key, required this.wars});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: wars.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 20.0,
        ),
        itemBuilder: (context, index) => Container(
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
                 wars[index][FirebaseKeys.title],
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.poppins50016,
                ),
              ),
              const SizedBox(width: 15.0),
              SizedBox(
                height: 90,
                width: 47,
                child: CachedNetworkImage(
                  imageUrl: wars[index][FirebaseKeys.image],
                  placeholder: (context, url) =>
                      CircularProgressIndicator(color: AppColors.primaryColor),
                  errorWidget: (context, url, error) {
                    log(error.toString());
                    return Icon(Icons.error, color: AppColors.primaryColor);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
