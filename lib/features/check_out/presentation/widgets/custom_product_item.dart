import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/data/models/souvenir_model.dart';
import 'package:flutter/material.dart';

class CustomProductItem extends StatelessWidget {
  final SouvenirModel souvenirModel;
  final int count;
  const CustomProductItem({super.key, required this.souvenirModel, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 0.5),
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: CachedNetworkImage(
              imageUrl:
                  souvenirModel.image,
              placeholder: (context, url) =>
                  CircularProgressIndicator(color: AppColors.primaryColor),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: AppColors.primaryColor),
              height: 90,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                souvenirModel.title,
                style: AppTextStyles.pacifico40064.copyWith(fontSize: 18.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "${souvenirModel.price} \$",
              ),
            ],
          ),
          const Spacer(), 
          Text(
            "$count items",
            style: AppTextStyles.font22,
          ),
        ],
      ),
    );
  }
}
