import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomPriceWiget extends StatelessWidget {
  final String price;
  const CustomPriceWiget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Price: $price \$", 
        style: AppTextStyles.pacifico40064.copyWith(fontSize: 30.0),
      ),
    );
  }
}