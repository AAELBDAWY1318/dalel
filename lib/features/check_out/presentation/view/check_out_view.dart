import 'dart:developer';

import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/core/widgets/custom_header_texr.dart';
import 'package:dalel/features/check_out/presentation/widgets/custom_address_component.dart';
import 'package:dalel/features/check_out/presentation/widgets/custom_selected_product_section.dart';
import 'package:flutter/material.dart';

class CheckOutView extends StatefulWidget {
  final dynamic data;
  const CheckOutView({super.key, required this.data});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  late final List<String> ids;
  late final List<double> paymentList;
  double sum = 0;

  void getTotalPayment() {
    for (int i = 0; i < paymentList.length; i++) {
      sum += paymentList[i];
    }
  }

  @override
  void initState() {
    ids = widget.data[0];
    paymentList = widget.data[1];
    getTotalPayment();
    log("$sum");
    log("$paymentList");
    log("$ids");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          AppStrings.checkoutScreen,
          style: AppTextStyles.pacifico40064.copyWith(
            fontSize: 22.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
                child: CustomHeaderText(text: AppStrings.deliveryAddress)),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            const SliverToBoxAdapter(child: CustomAddressComponent()),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            const SliverToBoxAdapter(
                child: CustomHeaderText(text: AppStrings.selectedProduct)),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverToBoxAdapter(
                child: CustomSelectedProductSection(
              ids: ids,
              paymentList: paymentList,
            )),

            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            const SliverToBoxAdapter(child: CustomHeaderText(text: AppStrings.paymentMethod)), 
            
          ],
        ),
      ),
    );
  }
}
