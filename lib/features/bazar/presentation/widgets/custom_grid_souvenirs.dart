import 'package:dalel/core/functions/navigate.dart';
import 'package:dalel/core/widgets/custom_item_overview.dart';
import 'package:dalel/core/widgets/custom_shimmer_view.dart';
import 'package:dalel/features/home/cubit/home_cubit.dart';
import 'package:dalel/features/home/cubit/home_state.dart';
import 'package:dalel/features/home/presentation/widgets/custom_error_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomGridSouvenirs extends StatelessWidget {
  const CustomGridSouvenirs({super.key});

  @override
  Widget build(BuildContext context) {
    const double itemWidth = 90; // const width for item
    const double itemHeight = 200; // const height for item
    const double spacing = 10; // Spacing between items
    final double screenWidth = MediaQuery.of(context).size.width;
    final int crossAxisCount = (screenWidth / (itemWidth + spacing)).floor();
    return BlocProvider(
      create: (context) => HomeCubit()..getSouvenirs(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is GetSouvenirsSuccess) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: 0.9,
              ),
              itemCount: state.souvenirs.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: itemWidth,
                  height: itemHeight,
                  alignment: Alignment.center,
                  child: CustomItemOverview(
                    image: state.souvenirs[index].image,
                    title: state.souvenirs[index].title,
                    onTap: () {
                      customPushNavigation(context, "/souvenir",
                          data: state.souvenirs[index]);
                    },
                  ),
                );
              },
            );
          } else if (state is GetSouvenirsFailure) {
            return CustomErrorText(text: state.errorMessage);
          } else {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: spacing,
                mainAxisSpacing: spacing,
                childAspectRatio: 0.9,
              ),
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: itemWidth,
                  height: itemHeight,
                  alignment: Alignment.center,
                  child: const CustomShimmerView(width: 99, height: 133),
                );
              },
            );
          }
        },
      ),
    );
  }
}
