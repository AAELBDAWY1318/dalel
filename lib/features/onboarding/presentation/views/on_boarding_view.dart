import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/onboarding/presentation/widgets/page_view.dart';
import 'package:dalel/features/onboarding/presentation/widgets/skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 40.0,
              ),
              SkipButton(onTap: () {}),
              CustomPageView(controller: controller),
              const SizedBox(
                height: 30.0,
              ),
              CustomButton(text: AppStrings.next, onPressed: () {}),
              const SizedBox(
                height: 17.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
