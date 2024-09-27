import 'package:dalel/features/bazar/presentation/view/bazar_view.dart';
import 'package:dalel/features/home/cubit/home_state.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
import 'package:dalel/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  int index = 0;
  HomeCubit() : super(HomeInitial());
  List<Widget> screens = [
    const HomeScreen(),
    const BazarView(),
    const ProfileView(),
  ];

  Future<bool> onWillPop() async {
    if (index > 0) {
      index = 0;
      emit(WillPopState());
      return false;
    }
    return true;
  }

  changeBottomNavigationBar(int ind) {
    index = ind;
    emit(ChangeBottomNavigationBarState());
  }

  Widget getCurrentScreen() => screens[index];
}
