import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/check_out/cubit/check_out_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCheckOutBattomBar extends StatelessWidget {
  final List<String> ids;
  final List<double> paymentList;
  final double sum;
  const CustomCheckOutBattomBar(
      {super.key,
      required this.ids,
      required this.paymentList,
      required this.sum});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutCubit(),
      child: BlocBuilder<CheckOutCubit, CheckOutState>(
        builder: (context, state) {
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
                CustomButton(
                    text: AppStrings.confirmPayment,
                    onPressed: () {
                      customPushNavigation(context, "/webview", data: [
                        ids,
                        paymentList,
                        sum,
                        context.read<CheckOutCubit>().address
                      ]);
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
