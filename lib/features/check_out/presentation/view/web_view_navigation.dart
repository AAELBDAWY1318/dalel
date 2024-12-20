import 'dart:developer';

import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/models/order_model.dart';
import 'package:dalel/features/check_out/cubit/check_out_cubit.dart';
import 'package:dalel/features/check_out/presentation/widgets/loading_widget.dart';
import 'package:dalel/features/home/presentation/widgets/custom_error_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewNavigation extends StatelessWidget {
  final dynamic data;
  // [
  //    ids,
  //    paymentList,
  //    sum,
  //    context.read<CheckOutCubit>().address
  //  ]
  const WebViewNavigation({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => CheckOutCubit()..getUserData(),
          child: BlocBuilder<CheckOutCubit, CheckOutState>(
            builder: (context, state) {
              if (state is GetUserDataFailure) {
                return CustomErrorText(
                  text: state.errorMessage,
                );
              } else if (state is GetUserDataSuccess) {
                context.read<CheckOutCubit>().completePayment(
                      state.firstName,
                      state.lastName,
                      state.email,
                      data[2],
                      data[3].toString(),
                    );

                return const LoadingWidget(text: "Waiting");
              } else if (state is ConfirmPaymentSuccess) {
                return WebViewWidget(
                  controller: WebViewController()
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..loadRequest(
                        Uri.parse(context.read<CheckOutCubit>().fawaterkurl!))
                    ..setNavigationDelegate(
                      NavigationDelegate(
                        onNavigationRequest: (request) {
                          return NavigationDecision.navigate;
                        },
                        onPageFinished: (url) {
                          if (url.contains("success")) {
                            OrderModel orderModel = OrderModel(
                              userId: FirebaseAuth.instance.currentUser!.uid,
                              payment: data[2],
                              productIds: data[0],
                              city: data[3][0],
                              addressDetails: data[3][1],
                            );
                            log("$orderModel");
                            customPushReplacementNavigation(
                              context,
                              "/waiting",
                              data: orderModel,
                            );
                          } else if (url.contains("fail")) {
                            customPop(context);
                          }
                        },
                      ),
                    ),
                );
              } else {
                return const LoadingWidget(text: "GETTING DATA");
              }
            },
          ),
        ),
      ),
    );
  }
}
