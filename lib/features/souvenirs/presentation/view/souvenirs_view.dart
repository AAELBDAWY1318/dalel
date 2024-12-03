
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:dalel/features/souvenirs/presentation/widgets/price_widget.dart';
import 'package:dalel/features/souvenirs/presentation/widgets/souvenir_item.dart';
import 'package:flutter/material.dart';

class SouvenirsView extends StatelessWidget {
  final dynamic data;
  const SouvenirsView({super.key, required this.data});

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
            SliverToBoxAdapter(
                child: SouvenirItem(image: data.image,title: data.title)),
            const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
            SliverToBoxAdapter(child: CustomPriceWiget(price: data.price)),
            const SliverToBoxAdapter(child: SizedBox(height: 50.0)),
            SliverToBoxAdapter(child: CustomButton(text: "ADD TO CARD", onPressed: (){})), 
          ],
        ),
      ),
    );
  }
}