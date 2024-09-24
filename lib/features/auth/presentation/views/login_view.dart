import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_signin_form.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_welcome_bar.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: CustomWelcomeBar()),
          SliverToBoxAdapter(child: SizedBox(height: 20.0)),
          SliverToBoxAdapter(child: WelcomeText(text: AppStrings.welcomeBack)),
          SliverToBoxAdapter(child: CustomSigInForm()),
        ],
      ),
    );
  }
}
