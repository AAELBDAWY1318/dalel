import 'package:dalel/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodView extends StatelessWidget {
  final Map<String, dynamic>? data;
  const HistoricalPeriodView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          slivers: [
            //!appbar section
            SliverToBoxAdapter(child: SizedBox(height: 50.0)),
            SliverToBoxAdapter(child: CustomAppBar()),
            SliverToBoxAdapter(child: SizedBox(height: 32.0)),
            // !custom title Section

            SliverToBoxAdapter(),
          ],
        ),
      ),
    );
  }
}

//historicalPeriod
