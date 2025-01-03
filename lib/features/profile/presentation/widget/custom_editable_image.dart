
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalel/core/functions/show_custom_snack_bar.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomEditableImage extends StatelessWidget {
  final String image;
  const CustomEditableImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    String?  editableImage ;
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is PickImageFailure) {
            showSnackBar(context, text: state.errorMessage, color: Colors.red);
          }
          if(state is UpdateUserInfoSuccess){
            editableImage = state.data[FirebaseKeys.image];
          }
        },
        builder: (context, state) {
          return Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: editableImage ?? image,
                    width: MediaQuery.of(context).size.width * 0.3,
                    placeholder: (context, url) => SizedBox(
                        width: 40,
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor)),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error, color: AppColors.primaryColor),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<ProfileCubit>().pickImage();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.edit,
                      color: AppColors.deepBrown,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
