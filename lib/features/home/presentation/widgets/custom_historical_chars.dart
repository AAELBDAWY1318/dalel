import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/widgets/custom_item_overview.dart';
import 'package:dalel/core/widgets/custom_shimmer_view.dart';
import 'package:dalel/features/home/cubit/home_cubit.dart';
import 'package:dalel/features/home/cubit/home_state.dart';
import 'package:dalel/features/home/presentation/widgets/custom_error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomHistoricalCharactersWidget extends StatelessWidget {
  const CustomHistoricalCharactersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHistoricalCharacters(),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        if (state is GetHistoricalCharactersFailure) {
          return CustomErrorText(text: state.errorMessage);
        } else if (state is GetHistoricalCharactersSuccess) {
          return SizedBox(
            height: 133,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomItemOverview(
                  image: state.historicalCharacters[index].image,
                  title: state.historicalCharacters[index].name,
                  onTap: () {
                    customPushNavigation(
                      context,
                      "/historicalChar",
                      data: state.historicalCharacters[index],
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 16.0,
              ),
              itemCount: state.historicalCharacters.length,
            ),
          );
        } else {
          return SizedBox(
            height: 133,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  const CustomShimmerView(width: 99, height: 133),
              itemCount: 3,
              separatorBuilder: (context, index) => const SizedBox(
                width: 16.0,
              ),
            ),
          );
        }
      }),
    );
  }
}
