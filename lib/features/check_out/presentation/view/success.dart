import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_header_texr.dart';
import 'package:flutter/material.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
              ),
              Image.asset(
                Assets.assetsImagesSuccess,
              ),
              const SizedBox(height: 15.0,),
              const CustomHeaderText(text: AppStrings.orderSuccess),
              const SizedBox(height: 15.0,),
              Text(
                AppStrings.thankYou,
                style: AppTextStyles.font14,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              CustomButton(text: AppStrings.backToHome, onPressed: (){
                customPushAndRemoveAll(context, "/home");
              }),
            ],
          ),
        ),
      ),
    );
  }
}
