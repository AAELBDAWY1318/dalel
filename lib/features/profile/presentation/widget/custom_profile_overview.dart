import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/presentation/widgets/custom_error_text.dart';
import 'package:dalel/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomProfileOverview extends StatelessWidget {
  const CustomProfileOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserData(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is GetUserDataSuccess) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: state.image,
                      width: 70.0,
                      placeholder: (context, url) => SizedBox(
                          width: 40,
                          child: CircularProgressIndicator(
                              color: AppColors.primaryColor)),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, color: AppColors.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${state.firstName} ${state.lastName}",
                      style: AppTextStyles.font18500,
                    ),
                    Text(
                      state.email,
                      style: AppTextStyles.font14,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      customPushNavigation(context, "/edit", data: 
                        {
                          "image": state.image,
                          "firstName": state.firstName,
                          "secondName": state.lastName,
                          "email": state.email,
                        },
                      );
                    },
                    icon: Icon(
                      Icons.mode_edit_outline_outlined,
                      color: AppColors.grey,
                    ),
                  ),
                ),
              ],
            );
          } else if (state is GetUserDataFailure) {
            return CustomErrorText(text: state.errorMessage);
          } else {
            return Center(
                child:
                    CircularProgressIndicator(color: AppColors.primaryColor));
          }
        },
      ),
    );
  }
}
