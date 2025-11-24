import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce/core/services/shared_perfernces.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/widgets/constant.dart';
import 'package:e_commerce/core/widgets/custtom_buttom.dart';
import 'package:e_commerce/features/auth/presentation/view/login_view.dart';
import 'package:e_commerce/features/onboarding/presentation/view/widgets/on_boarding_page_view.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late final PageController controller;
  var currentPage = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
  }

  @override
  void initState() {
    controller = PageController();
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: OnBoardingPageView(controller: controller)),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,

            activeSize: const Size(20.0, 10.0),
            spacing: const EdgeInsets.symmetric(horizontal: 5.0),
            color: currentPage == 1 ? AppColors.primaryColor : Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CusttomButtom(
            onPressed: () {
              Preferences.setBool(kIsOnboardVisible, true);
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            },
            isVisible: (currentPage == 1),

            text: "ابدأ الان",
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
