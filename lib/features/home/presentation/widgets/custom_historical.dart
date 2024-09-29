import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/widgets/custom_period_item.dart';
import 'package:flutter/material.dart';

class CustomHistorical extends StatelessWidget {
  const CustomHistorical({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomPeriodContainer(
            image: Assets.assetsImagesFrame,
            text: "Ancient Egypt",
            onTap: () {},
          ),
          const SizedBox(width: 16),
          CustomPeriodContainer(
            image: Assets.assetsImagesFrame,
            text: "Ancient Egypt",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
