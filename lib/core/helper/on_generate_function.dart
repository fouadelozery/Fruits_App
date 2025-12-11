import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/features/auth/presentation/sign_up_view.dart';
import 'package:e_commerce/features/auth/presentation/view/login_view.dart';
import 'package:e_commerce/features/best_selling/presentation/views/best_selling_view.dart';
import 'package:e_commerce/features/checkout/presentation/views/checkout_view.dart';
import 'package:e_commerce/features/home/domain/entity/cart_entity.dart';
import 'package:e_commerce/features/home/presentation/view/cart_view.dart';
import 'package:e_commerce/features/home/presentation/view/main_view.dart';
import 'package:e_commerce/features/product_details/presentation/views/product_details_view.dart';
import 'package:e_commerce/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:e_commerce/features/profile/presentation/views/profile_view.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/personal_profile.dart';
import 'package:e_commerce/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    case ProfileView.routeName:
      return MaterialPageRoute(builder: (_) => const ProfileView());

    case ProductDetailsView.routeName:
      if (settings.arguments is! ProductEntity) {
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Invalid product data')),
              ),
        );
      }
      final product = settings.arguments as ProductEntity;
      return MaterialPageRoute(
        builder: (_) => ProductDetailsView(product: product),
      );

    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());

    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSellingView());
    case CartView.routeName:
      return MaterialPageRoute(builder: (_) => const CartView());
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());

    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    case MainView.routeName:
      return MaterialPageRoute(builder: (_) => const MainView());
    case PersonalProfile.routeName:
      return MaterialPageRoute(builder: (_) => const PersonalProfile());

    case CheckoutView.routeName:
      if (settings.arguments is! CartEntity) {
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('Invalid cart data')),
              ),
        );
      }
      final cartEntity = settings.arguments as CartEntity;
      return MaterialPageRoute(
        builder: (_) => CheckoutView(cartEntity: cartEntity),
      );

    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(body: Center(child: Text('Page not found'))),
      );
  }
}
