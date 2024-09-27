
import 'package:dalel/features/home/cubit/home_cubit.dart';
import 'package:dalel/features/home/cubit/home_state.dart';
import 'package:dalel/features/home/presentation/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppLayouts extends StatelessWidget {
  const AppLayouts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
        return WillPopScope(
          onWillPop: homeCubit.onWillPop,
          child: Scaffold(
            bottomNavigationBar: CustomNavigationBar(
              currentIndex: homeCubit.index,
              onTap: (index) {
                homeCubit.changeBottomNavigationBar(index);
              },
            ),
            body: homeCubit.getCurrentScreen(),
          ),
        );
      },
    );
  }
}
