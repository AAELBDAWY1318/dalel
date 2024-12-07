import 'dart:developer';

import 'package:dalel/core/models/cart_model.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/my_cart/presentation/widgets/custom_cart_item.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          "My Cart",
          style: AppTextStyles.pacifico40064.copyWith(fontSize: 20.0),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        child: CustomCartItem(
          onItemUpdated: (isChecked, paymentPerItem, productId) async {
            log("$isChecked ---- $paymentPerItem ---- $productId");
          },
          cartModel: CartModel(
            userId: "userId",
            image: "image",
            title: "title",
            id: "id",
            price: "120.0",
          ),
        ),
      ),
    );
  }
}
