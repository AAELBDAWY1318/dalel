import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomPageView extends StatelessWidget {
  final PageController controller;
  const CustomPageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.0,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 46.0),
            child: Column(
              children: [
                Image.asset(Assets.assetsImagesOnboarding1),
                const SizedBox(
                  height: 24.0,
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.deepBrown,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const Text(
                  "Explore The history with Dalel in a smart way", 
                  style: AppTextStyles.poppins50024,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 24.0,
                ), 
                Text(
                  "Using our app’s history libraries you can find many historical periods ", 
                  style: AppTextStyles.poppins50024.copyWith(
                    fontSize: 16.0, 
                    fontWeight: FontWeight.w300, 
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
          
                ), 
              ],
            ),
          );
        },
      ),
    );
  }
}
