import 'package:flutter/material.dart';

class CheckoutController extends ChangeNotifier {
  final PageController pageController = PageController();
  final GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();
  final ValueNotifier<AutovalidateMode> validatorMode = ValueNotifier(
    AutovalidateMode.disabled,
  );

  int currentPage = 0;

  void initListener() {
    pageController.addListener(() {
      int page = pageController.page!.round();
      if (page != currentPage) {
        currentPage = page;
        notifyListeners();
      }
    });
  }

  void goNext() {
    pageController.animateToPage(
      currentPage + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void handleAddressingValidation() {
    if (addressFormKey.currentState!.validate()) {
      addressFormKey.currentState!.save();
      goNext();
    } else {
      validatorMode.value = AutovalidateMode.always;
    }
  }
}
