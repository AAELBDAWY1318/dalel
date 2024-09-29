import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/widgets/custom_item_overview.dart';
import 'package:flutter/material.dart';

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return const CustomItemOverview(
            image: Assets.assetsImagesSalahaldin,
            title: "Salah ElDin",
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 16.0,
        ),
      ),
    );
  }
}
