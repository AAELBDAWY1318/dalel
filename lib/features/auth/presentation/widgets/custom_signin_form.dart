import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';
import 'package:dalel/features/auth/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/cubit/auth_states.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_action_row.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSigInForm extends StatelessWidget {
  const CustomSigInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomTextField(
                  label: AppStrings.emailAddress,
                  controller: authCubit.email,
                ),
                CustomTextField(
                  label: AppStrings.password,
                  controller: authCubit.password,
                  obscureText: authCubit.obscureText,
                  suffixIcon: IconButton(
                      icon: Icon(authCubit.icon),
                      onPressed: () {
                        authCubit.changeEyeIcon();
                      }),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    onPressed: () {},
                    text: AppStrings.forgotPassword,
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomButton(
                  onPressed: () {},
                  text: AppStrings.signIn,
                ),
                CustomActionRow(
                  text1: AppStrings.dontHaveAnAccount,
                  text2: AppStrings.signUp,
                  onTap: () {
                    customPushNavigation(context, "/signUp");
                  },
                ),
                const SizedBox(height: 10.0,),
              ],
            ),
          ),
        );
      },
    );
  }
}
