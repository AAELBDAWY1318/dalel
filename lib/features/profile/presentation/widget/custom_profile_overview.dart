import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomProfileOverview extends StatelessWidget {
  const CustomProfileOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
     
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl:
                  "https://th.bing.com/th/id/R.a72dc8e0a65daeaae08879d76e90fce1?rik=H8L2x3j2fhrBsA&pid=ImgRaw&r=0",
              width: 70.0,
              placeholder: (context, url) => SizedBox(
                  width: 40,
                  child:
                      CircularProgressIndicator(color: AppColors.primaryColor)),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: AppColors.primaryColor),
            ),
          ),
        ),
        const SizedBox(width: 8.0,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Abdullah Awad",
              style: AppTextStyles.font18500,
            ),
            Text(
              "abdullahawad1318@gmail.com",
              style: AppTextStyles.font14,
            ),
          ],
        ),
        const SizedBox(width: 8.0,),
        Expanded(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mode_edit_outline_outlined,
              color: AppColors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
