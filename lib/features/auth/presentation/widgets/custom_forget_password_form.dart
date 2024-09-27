import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/functions/show_custom_snack_bar.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/cubit/auth_states.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          showSnackBar(context, text: state.errorMessage, color: Colors.red);
        } else if (state is ResetPasswordSuccess) {
          showSnackBar(context,
              text: "See your email to reset password", color: Colors.green);
          customPushReplacementNavigation(context, "/login");
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.forgetpasswordKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CustomTextField(
                  label: AppStrings.emailAddress,
                  controller: authCubit.email,
                ),
                const SizedBox(height: 20.0),
                state is ResetPasswordLoading
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomButton(
                        onPressed: () {
                          if (authCubit.forgetpasswordKey.currentState!
                              .validate()) {
                            authCubit.resetPassword();
                          }
                        },
                        text: AppStrings.sendResetPasswordLink,
                      ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
