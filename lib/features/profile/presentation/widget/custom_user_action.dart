import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/profile/presentation/widget/custom_action_item.dart';
import 'package:flutter/material.dart';

class CustomUserAction extends StatelessWidget {
  const CustomUserAction({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> actions = [
      {"icon": Icons.shopping_cart, 'text': "Orders", "function": () {}},
      {"icon": Icons.logout, 'text': "Logout", "function": () {}},
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              CustomActionItem(data: actions[index]),
          separatorBuilder: (context, index) => Container(
                height: 0.5,
                color: AppColors.grey,
              ),
          itemCount: actions.length),
    );
  }
}
