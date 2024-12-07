import 'package:dalel/core/widgets/custom_shimmer_view.dart';
import 'package:flutter/material.dart';

class CustomCartLoading extends StatelessWidget {
  const CustomCartLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Expanded(child: CustomShimmerView(width: 25, height: 25)),
          const SizedBox(
            width: 10.0,
          ),
          CustomShimmerView(
            width: MediaQuery.sizeOf(context).width * 0.8,
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
