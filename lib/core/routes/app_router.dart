import 'package:dalel/features/auth/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forget_password_view.dart';
import 'package:dalel/features/auth/presentation/views/login_view.dart';
import 'package:dalel/features/auth/presentation/views/signup_view.dart';
import 'package:dalel/features/check_out/presentation/view/check_out_view.dart';
import 'package:dalel/features/check_out/presentation/view/success.dart';
import 'package:dalel/features/check_out/presentation/view/waiting_view.dart';
import 'package:dalel/features/check_out/presentation/view/web_view_navigation.dart';
import 'package:dalel/features/historical_char/presentation/view/historical_char_view.dart';
import 'package:dalel/features/historical_period/presentation/view/historical_period_view.dart';
import 'package:dalel/features/home/presentation/view/app_layouts.dart';
import 'package:dalel/features/my_cart/presentation/view/my_cart_view.dart';
import 'package:dalel/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/profile/presentation/views/edit_profile.dart';
import 'package:dalel/features/souvenirs/cubit/souvenir_cubit.dart';
import 'package:dalel/features/souvenirs/presentation/view/souvenirs_view.dart';
import 'package:dalel/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashView(),
  ),
  GoRoute(
    path: "/onBoarding",
    builder: (context, state) => const OnBoardingView(),
  ),
  GoRoute(
    path: "/signUp",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const SignUpView(),
    ),
  ),
  GoRoute(
    path: "/login",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const LoginView(),
    ),
  ),
  GoRoute(
    path: "/forgetPassword",
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const ForgetPasswordView(),
    ),
  ),
  GoRoute(
    path: "/home",
    builder: (context, state) => const AppLayouts(),
  ),
  GoRoute(
    path: "/historicalPeriod",
    builder: (context, state) {
      final data = state.extra;
      return HistoricalPeriodView(data: data);
    },
  ),
  GoRoute(
      path: "/historicalChar",
      builder: (context, state) {
        final data = state.extra;
        return HistoricalCharView(data: data);
      }),
  GoRoute(
      path: "/souvenir",
      builder: (context, state) {
        final data = state.extra;
        return BlocProvider(
          create: (context) => SouvenirCubit(),
          child: SouvenirsView(data: data),
        );
      }),
  GoRoute(
    path: "/myCart",
    builder: (context, state) => const MyCartView(),
  ),
  GoRoute(
    path: "/ceckout",
    builder: (context, state) {
      final data = state.extra;
      return CheckOutView(data: data);
    },
  ),
  GoRoute(
    path: "/webview",
    builder: (context, state) {
      final data = state.extra;
      return WebViewNavigation(data: data);
    },
  ),
  GoRoute(
    path: "/success",
    builder: (context, state) => const PaymentSuccessView(),
  ),
  GoRoute(
    path: "/waiting",
    builder: (context, state) {
      final data = state.extra;
      return WaitingView(
        order: data,
      );
    },
  ),
  GoRoute(
    path: "/edit",
    builder: (context, state) {
      final data = state.extra;
      return EditProfileView(
        userData: data,
      );
    },
  ),
]);
