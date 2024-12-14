import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/features/check_out/cubit/check_out_cubit.dart';
import 'package:dalel/features/check_out/presentation/widgets/loading_widget.dart';
import 'package:dalel/features/home/presentation/widgets/custom_error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaitingView extends StatelessWidget {
  final dynamic order;
  const WaitingView({super.key, this.order});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutCubit()..confirmorder(order),
      child: Scaffold(
        body: BlocConsumer<CheckOutCubit, CheckOutState>(
          listener: (context, state) {
            if (state is ConfirmOrderSuccess) {
              customPushReplacementNavigation(context, "/success");
            }
          },
          builder: (context, state) {
            if (state is ConfirmOrderFailure) {
              return CustomErrorText(text: state.errorMessage);
            } else if (state is ConfirmOrderSuccess) {
              //customPushReplacementNavigation(context, "/success");
              return const LoadingWidget(text: "waiting");
            } else {
              return const LoadingWidget(
                  text: "please, waiting to end processing");
            }
          },
        ),
      ),
    );
  }
}
