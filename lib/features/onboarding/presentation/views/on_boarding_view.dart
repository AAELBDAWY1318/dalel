import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/services/locator_service.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';
import 'package:dalel/features/onboarding/data/models/on_boarding_model.dart';
import 'package:dalel/features/onboarding/presentation/widgets/page_view.dart';
import 'package:dalel/features/onboarding/presentation/widgets/skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController controller = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
              SkipButton(onTap: () {
                getIt<CacheHelper>().saveData(key: "isVisited", value: true);
                customPushReplacementNavigation(context, "/login");
              }),
              CustomPageView(
                controller: controller,
                onPageChanged: (index) {
                  currentIndex = index;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              currentIndex == onBoardingData.length - 1
                  ? Column(
                      children: [
                        CustomButton(
                            text: AppStrings.createAccount,
                            onPressed: () {
                              getIt<CacheHelper>().saveData(key: "isVisited", value: true);
                              customPushReplacementNavigation(
                                  context, "/signUp");
                            }),
                        CustomTextButton(
                          onPressed: () {
                            getIt<CacheHelper>().saveData(key: "isVisited", value: true);
                            customPushReplacementNavigation(context, "/login");
                          },
                          text: AppStrings.loginNow,
                        ),
                      ],
                    )
                  : CustomButton(
                      text: AppStrings.next,
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(microseconds: 200),
                            curve: Curves.decelerate);
                        setState(() {});
                      }),
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
