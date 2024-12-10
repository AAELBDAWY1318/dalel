import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/functions/show_custom_snack_bar.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/my_cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBattomBarCart extends StatelessWidget {
  const CustomBattomBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.10,
      color: Colors.white,
      child: CustomButton(
          text: AppStrings.checkoutNow,
          onPressed: () {
            if (context.read<CartCubit>().ids.isNotEmpty) {
              customPushNavigation(context, "/ceckout", data: [
                context.read<CartCubit>().ids,
                context.read<CartCubit>().paymentList
              ]);
            } else {
              showSnackBar(context,
                  text: "No Items Sellected", color: AppColors.primaryColor);
            }
          }),
    );
  }
}
