import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final Function(int)? onTap;
  final int currentIndex;
  const CustomNavigationBar(
      {super.key, this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.deepBrown,
        unselectedItemColor: AppColors.lightGrey,
      ),
    );
  }
}
