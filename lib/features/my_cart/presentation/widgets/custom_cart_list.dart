import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/home/presentation/widgets/custom_error_text.dart';
import 'package:dalel/features/my_cart/cubit/cart_cubit.dart';
import 'package:dalel/features/my_cart/presentation/widgets/custom_cart_item.dart';
import 'package:dalel/features/my_cart/presentation/widgets/custom_loading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartList extends StatelessWidget {
  const CustomCartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getMyCart(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetMyCartSuccess) {
            if (state.myCartList.isNotEmpty) {
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return CustomCartItem(
                    cartModel: state.myCartList[index],
                    onItemUpdated: (check, payment, id) async {
                      if (check) {
                        int index = CartCubit()
                            .ids
                            .indexWhere((element) => element == id);
                        if (index == -1) {
                          CartCubit().ids.add(id);
                          CartCubit().paymentList.add(payment);
                        } else {
                          CartCubit().ids[index] = id;
                          CartCubit().paymentList[index] = payment;
                        }
                      }
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: state.myCartList.length,
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 100.0,
                      color: AppColors.deepBrown,
                    ),
                    Text(
                      "No Shopping Items at this time",
                      style:
                          AppTextStyles.pacifico40064.copyWith(fontSize: 30.0),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
          } else if (state is GetMyCartFailure) {
            return CustomErrorText(text: state.errorMessage);
          } else {
            return const CustomLoadingCartList();
          }
        },
      ),
    );
  }
}
