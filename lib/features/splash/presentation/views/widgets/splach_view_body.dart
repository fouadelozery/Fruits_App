import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/core/services/shared_perfernces.dart';
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:e_commerce/core/widgets/constant.dart';
import 'package:e_commerce/features/auth/presentation/view/login_view.dart';
import 'package:e_commerce/features/home/view/home_view.dart';
import 'package:e_commerce/features/onboarding/presentation/view/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({super.key});

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody> {
  @override
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigateToOnBoarding();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),

        Center(child: SvgPicture.asset(Assets.imagesLogo)),

        const Spacer(),
      ],
    );
  }

  void navigateToOnBoarding() {
    bool isOnBoardVisible = Preferences.getBool(kIsOnboardVisible) ?? false;

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return; 

      if (isOnBoardVisible) {
        var isLoggedIn = FirebaseAuthService().isSignIn();
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(context, HomeView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
