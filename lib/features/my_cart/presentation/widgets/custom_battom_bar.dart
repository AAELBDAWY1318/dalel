import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomBattomBarCart extends StatelessWidget {
  const CustomBattomBarCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.10,
      color: Colors.white,
      child: CustomButton(text: AppStrings.checkoutNow, onPressed: () {}),
    );
  }
}
