import 'package:dalel/features/my_cart/presentation/widgets/custom_cart_loading.dart';
import 'package:flutter/material.dart';

class CustomLoadingCartList extends StatelessWidget {
  const CustomLoadingCartList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context , index){
        return const CustomCartLoading();
      },
      itemCount: 3,
    );
  }
}