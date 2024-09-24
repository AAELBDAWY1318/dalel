import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_action_row.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/term_and_condition_widget.dart';
import 'package:dalel/features/auth/presentation/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool obscureText = true;
  IconData icon = Icons.visibility_off;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 120.0,
              ),
            ),
            const SliverToBoxAdapter(
              child: WelcomeText(),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                label: AppStrings.fristName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                label: AppStrings.lastName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                label: AppStrings.emailAddress,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                label: AppStrings.password,
                obscureText: obscureText,
                suffixIcon: IconButton(
                  icon: Icon(icon),
                  onPressed: () {
                    obscureText = !obscureText;
                    if (obscureText) {
                      icon = Icons.visibility_off;
                    } else {
                      icon = Icons.visibility;
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TermAndConditionWidget(
                onChanged: (value) {
                  check = value!;
                  setState(() {});
                },
                value: check,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40.0,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomButton(
                onPressed: () {},
                text: AppStrings.signUp,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomActionRow(
                onTap: (){},
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
