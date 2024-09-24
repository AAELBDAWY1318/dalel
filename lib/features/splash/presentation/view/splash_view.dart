import 'dart:async';

import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/services/locator_service.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isVisited = getIt<CacheHelper>().getData(key: "isVisited")?? false;
    Timer(const Duration(seconds: 2), () {
      if(isVisited){
        customPushReplacementNavigation(context, "/signUp");
      }else{
        customPushReplacementNavigation(context, "/onBoarding");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: AppTextStyles.pacifico40064,
        ),
      ),
    );
  }
}
