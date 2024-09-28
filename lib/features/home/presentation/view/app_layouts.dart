import 'package:dalel/features/bazar/presentation/view/bazar_view.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/features/home/presentation/widgets/custom_navigation_bar.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:dalel/features/search/presentation/view/search_view.dart';
import 'package:flutter/material.dart';

class AppLayouts extends StatefulWidget {
  const AppLayouts({super.key});

  @override
  State<AppLayouts> createState() => _AppLayoutsState();
}

class _AppLayoutsState extends State<AppLayouts> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const BazarView(),
    const SearchView(), 
    const ProfileView(),
  ];
  Future<bool> onWillPop() async {
    if (currentIndex == 1 || currentIndex == 2) {
      setState(() {
        currentIndex = 0;
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
