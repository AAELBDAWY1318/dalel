import 'package:dalel/core/functions/show_custom_snack_bar.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/home/data/models/souvenir_model.dart';
import 'package:dalel/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:dalel/features/souvenirs/cubit/souvenir_cubit.dart';
import 'package:dalel/features/souvenirs/presentation/widgets/price_widget.dart';
import 'package:dalel/features/souvenirs/presentation/widgets/souvenir_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SouvenirsView extends StatelessWidget {
  final dynamic data;
  const SouvenirsView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: BlocConsumer<SouvenirCubit, SouvenirState>(
          listener: (context, state) {
            if (state is AddToCartFailureState) {
              showSnackBar(context, text: state.message, color: Colors.red);
            } else if (state is AddToCartSuccessState) {
              showSnackBar(context,
                  text: "Add to cart successfully", color: Colors.green);
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                //!appbar section
                const SliverToBoxAdapter(child: SizedBox(height: 50.0)),
                const SliverToBoxAdapter(child: CustomAppBar()),
                const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
                SliverToBoxAdapter(
                    child: SouvenirItem(image: data.image, title: data.title)),
                const SliverToBoxAdapter(child: SizedBox(height: 32.0)),
                SliverToBoxAdapter(child: CustomPriceWiget(price: data.price)),
                const SliverToBoxAdapter(child: SizedBox(height: 50.0)),
                SliverToBoxAdapter(
                    child: State is AddToCartLoadingState
                        ? CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          )
                        : CustomButton(
                            text: "ADD TO CARD",
                            onPressed: () {
                              context
                                  .read<SouvenirCubit>()
                                  .addToCart(SouvenirModel(
                                    id: data.id,
                                    image: data.image,
                                    price: data.price,
                                    title: data.title,
                                  ));
                            })),
              ],
            );
          },
        ),
      ),
    );
  }
}
