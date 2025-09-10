import 'package:e_commerce/features/auth/presentation/sign_up_view.dart';
import 'package:e_commerce/features/auth/presentation/view/login_view.dart';
import 'package:e_commerce/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:e_commerce/features/home/view/home_view.dart';
import 'package:e_commerce/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:e_commerce/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());

    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
