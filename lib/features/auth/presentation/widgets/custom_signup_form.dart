import 'package:dalel/core/functions/email_validation.dart';
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/functions/show_custom_snack_bar.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/cubit/auth_states.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/term_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          showSnackBar(context, text: state.errorMessage, color: Colors.red);
        } else if (state is SignUpSuccess) {
          showSnackBar(context,
              text: "SignUp, please confirm your email",
              color: const Color.fromARGB(255, 9, 214, 115));
          customPushReplacementNavigation(context, "/login");
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpKey,
          child: Column(
            children: [
              CustomTextField(
                label: AppStrings.fristName,
                controller: authCubit.fristName,
              ),
              CustomTextField(
                label: AppStrings.lastName,
                controller: authCubit.lastName,
              ),
              CustomTextField(
                label: AppStrings.emailAddress,
                controller: authCubit.email,
                validator: validateEmail,
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
              TermAndConditionWidget(
                onChanged: (value) {
                  authCubit.changeCheckBox();
                },
                value: authCubit.check,
              ),
              const SizedBox(height: 40.0),
              !authCubit.check
                  ? CustomButton(
                      text: AppStrings.signUp,
                      color: AppColors.grey,
                      onPressed: () {},
                    )
                  : (state is SignUpLoading
                      ? CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : CustomButton(
                          onPressed: () {
                            if (authCubit.signUpKey.currentState!.validate()) {
                              authCubit.createAccountWithEmailAndPassword();
                            }
                          },
                          text: AppStrings.signUp,
                        )),
            ],
          ),
        );
      },
    );
  }
}
