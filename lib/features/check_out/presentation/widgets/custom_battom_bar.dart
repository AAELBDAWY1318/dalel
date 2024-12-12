import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomCheckOutBattomBar extends StatelessWidget {
  final List<String> ids;
  final List<double> paymentList;
  final double sum;
  const CustomCheckOutBattomBar({super.key, required this.ids, required this.paymentList, required this.sum});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: 120.0,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.totalPayment,
                style: AppTextStyles.poppins40022,
              ),
              Text(
                "$sum \$",
                style: AppTextStyles.font22,
              ),
            ],
          ),
          CustomButton(text: AppStrings.confirmPayment, onPressed: () {}),
        ],
      ),
    );
  }
}
