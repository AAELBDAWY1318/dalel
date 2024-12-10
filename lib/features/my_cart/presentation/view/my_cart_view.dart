import 'dart:developer';

import 'package:dalel/core/functions/show_custom_snack_bar.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/my_cart/cubit/cart_cubit.dart';
import 'package:dalel/features/my_cart/presentation/widgets/custom_battom_bar.dart';
import 'package:dalel/features/my_cart/presentation/widgets/custom_cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getMyCart(),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          title: Text(
            "My Cart",
            style: AppTextStyles.pacifico40064.copyWith(fontSize: 20.0),
          ),
          centerTitle: true,
          actions: [
            BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if (state is DeleteFromCartLoading) {
                  showSnackBar(context,
                      text: "waiting....", color: AppColors.primaryColor);
                } else if (state is DeleteFromCartFailure) {
                  showSnackBar(context,
                      text: "Failure, please try again", color: Colors.red);
                } else if (state is DeleteFromCartSuccess) {
                  showSnackBar(context,
                      text: "Successfully", color: Colors.green);
                  context.read<CartCubit>().getMyCart();
                  context.read<CartCubit>().ids = [];
                  context.read<CartCubit>().paymentList = [];
                  log("${context.read<CartCubit>().ids}");
                }
              },
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    context.read<CartCubit>().deleteDocumentsByField(
                          collectionPath: "cart",
                          fieldName: "id",
                          fieldValues: context.read<CartCubit>().ids,
                        );
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          child: CustomCartList(),
        ),
        bottomNavigationBar: const CustomBattomBarCart(),
      ),
    );
  }
}
