import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/functions/show_custom_snack_bar.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomActionItem extends StatelessWidget {
  const CustomActionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if(state is LogoutFailure){
            showSnackBar(context, text: state.errorMessage, color: Colors.red);
          }else if(state is LogoutSuccess){
            customPushAndRemoveAll(context, "/login");
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: state is LogoutLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      context.read<ProfileCubit>().logout();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: AppColors.deepBrown,
                          size: 30.0,
                        ),
                        const SizedBox(width: 20.0),
                        Text(
                          "Logout",
                          style:
                              AppTextStyles.font18500.copyWith(fontSize: 16.0),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.deepBrown,
                          size: 20.0,
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
