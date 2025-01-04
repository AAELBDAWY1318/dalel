import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomUpdateInfoForm extends StatelessWidget {
  final dynamic userData;
  const CustomUpdateInfoForm({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..setControllerValues(userData),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          return Column(
            children: [
              CustomTextField(
                label: "email",
                controller: context.read<ProfileCubit>().emailController,
              ),
              CustomTextField(
                label: "First Name",
                controller: context.read<ProfileCubit>().firstNameController,
              ),
              CustomTextField(
                label: "Last Name",
                controller: context.read<ProfileCubit>().lastNameController,
              ),
              const SizedBox(height: 30.0),
              state is UpdateInfoLoading
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomButton(
                      text: "Update Info",
                      onPressed: () {
                        context.read<ProfileCubit>().updateUserInfo();
                      }),
            ],
          );
        },
      ),
    );
  }
}
