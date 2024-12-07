import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/my_cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBattomBarCart extends StatefulWidget {
  const CustomBattomBarCart({super.key});

  @override
  State<CustomBattomBarCart> createState() => _CustomBattomBarCartState();
}

class _CustomBattomBarCartState extends State<CustomBattomBarCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.15,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Total Payment",
                style: AppTextStyles.poppins50016.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
              ),
              BlocProvider(
                create: (context) => CartCubit(),
                child: BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    CartCubit().getTotalPayment();

                    return Text("${CartCubit().sum}");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
