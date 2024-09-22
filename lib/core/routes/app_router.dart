import 'package:dalel/features/auth/presentation/views/login_view.dart';
import 'package:dalel/features/auth/presentation/views/signup_view.dart';
import 'package:dalel/features/onboarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/view/splash_view.dart';
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
    builder: (context, state) => const SignUpView(),
  ),
  GoRoute(
    path: "/login", 
    builder: (context, state) => const LoginView(),
  ),
]);