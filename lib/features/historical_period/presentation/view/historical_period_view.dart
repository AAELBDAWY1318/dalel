import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_texr.dart';
import 'package:dalel/core/widgets/custom_war_list.dart';
import 'package:dalel/features/historical_period/presentation/widgets/custom_historical_period_des.dart';
import 'package:dalel/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:dalel/features/home/presentation/widgets/custom_historical_chars.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodView extends StatelessWidget {
  final dynamic data;
  const HistoricalPeriodView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            //!appbar section
            const SliverToBoxAdapter(child: SizedBox(height: 50.0)),
            const SliverToBoxAdapter(child: CustomAppBar()),
            const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
            // !custom title Section
            SliverToBoxAdapter(child: CustomHeaderText(text: data.title)),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverToBoxAdapter(
                child: CustomHistoricalPeriodDescription(
              description: data.description,
              image: data.image,
            )),

            //! custom war Section
            const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
            const SliverToBoxAdapter(child: CustomHeaderText(text: "Wars")),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverToBoxAdapter(child: CustomWarItem(wars: data.wars,)),

            //! custom war Section
            const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
            const SliverToBoxAdapter(child: CustomHeaderText(text:AppStrings.recommendations)),
            const SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            const SliverToBoxAdapter(child: CustomHistoricalCharactersWidget()),
          ],
        ),
      ),
    );
  }
}
