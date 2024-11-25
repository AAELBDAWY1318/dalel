import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/widgets/custom_period_item.dart';
import 'package:dalel/core/widgets/custom_shimmer_view.dart';
import 'package:dalel/features/home/cubit/home_cubit.dart';
import 'package:dalel/features/home/cubit/home_state.dart';
import 'package:dalel/features/home/presentation/widgets/custom_error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHistorical extends StatelessWidget {
  const CustomHistorical({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHistoricalPeriods(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetHistoricalPeriodsFailure) {
            return CustomErrorText(text: state.errorMessage);
          } else if (state is GetHistoricalPeriodsSuccess) {
            return SizedBox(
              height: 96,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => CustomPeriodContainer(
                  historicalPeriod: state.historicalPeriod[index],
                  onTap: () => customPushNavigation(
                    context,
                    "/historicalPeriod",
                    data: state.historicalPeriod[index],
                  ),
                ),
                itemCount: state.historicalPeriod.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 16.0,
                ),
              ),
            );
          } else {
            return SizedBox(
              height: 96,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    const CustomShimmerView(width: 165, height: 96),
                itemCount: 2,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 16.0,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
