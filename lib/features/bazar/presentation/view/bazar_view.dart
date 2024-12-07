import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:dalel/features/bazar/presentation/widgets/custom_grid_souvenirs.dart';
import 'package:flutter/material.dart';

class BazarView extends StatelessWidget {
  const BazarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.bazar),
        titleTextStyle: AppTextStyles.pacifico40064.copyWith(fontSize: 30.0),
        centerTitle: true,
      ),
      body: const CustomGridSouvenirs(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: AppColors.primaryColor,
        child: const Icon(
          Icons.shopping_cart, 
        ),
      ),
    );
  }
}
