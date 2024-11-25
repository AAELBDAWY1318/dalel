import 'package:dalel/core/widgets/custom_item_overview.dart';
import 'package:flutter/material.dart';

class CustomListViewBuilder extends StatelessWidget {
  final String image, title;
  final Function() onTap;
  const CustomListViewBuilder(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

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
          return CustomItemOverview(
            image: image,
            title: title,
            onTap: onTap,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 16.0,
        ),
      ),
    );
  }
}
