import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_forget_password_form.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 90.0)),
          const SliverToBoxAdapter(
              child: WelcomeText(text: AppStrings.forgotPassword)),
          SliverToBoxAdapter(
            child: Image.asset(
              Assets.assetsImagesForget,
              height: 200.0,
              width: 200.0,
            ),
          ),
          const SliverToBoxAdapter(child: CustomForgetPasswordForm()),
        ],
      ),
    );
  }
}
