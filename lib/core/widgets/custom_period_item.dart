import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/data/models/historical_period_model.dart';
import 'package:flutter/material.dart';

class CustomPeriodContainer extends StatelessWidget {
  final Function()? onTap;
  final HistoricalPeriod historicalPeriod;
  const CustomPeriodContainer(
      {super.key, this.onTap, required this.historicalPeriod});

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
                historicalPeriod.title,
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
                imageUrl: historicalPeriod.image,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
