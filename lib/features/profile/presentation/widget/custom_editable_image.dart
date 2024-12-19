import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomEditableImage extends StatelessWidget {
  final String image;
  const CustomEditableImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              width: MediaQuery.of(context).size.width * 0.3,
              placeholder: (context, url) => SizedBox(
                  width: 40,
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor)),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: AppColors.primaryColor),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.edit,
                color: AppColors.deepBrown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
