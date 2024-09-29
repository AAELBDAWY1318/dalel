import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_texr.dart';
import 'package:dalel/core/widgets/custom_list_view.dart';
import 'package:dalel/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:dalel/features/home/presentation/widgets/custom_historical.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            //!appbar section
            SliverToBoxAdapter(child: SizedBox(height: 50.0)),
            SliverToBoxAdapter(child: CustomAppBar()),
            SliverToBoxAdapter(child: SizedBox(height: 32.0)),
            //!historical periods section
            SliverToBoxAdapter(child: CustomHeaderText(text: AppStrings.historicalPeriods)),
            SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverToBoxAdapter(child: CustomHistorical()),
            SliverToBoxAdapter(child: SizedBox(height: 32.0)),
            //! historical characters section
            SliverToBoxAdapter(child: CustomHeaderText(text: AppStrings.historicalCharacters)),
            SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverToBoxAdapter(child: CustomListViewBuilder()), 
            SliverToBoxAdapter(child: SizedBox(height: 32.0)),
            //! historical Souvenirs section
            SliverToBoxAdapter(child: CustomHeaderText(text: AppStrings.historicalSouvenirs)),
            SliverToBoxAdapter(child: SizedBox(height: 16.0)),
            SliverToBoxAdapter(child: CustomListViewBuilder()), 
            SliverToBoxAdapter(child: SizedBox(height: 16.0)),
          ],
        ),
      ),
    );
  }
}

