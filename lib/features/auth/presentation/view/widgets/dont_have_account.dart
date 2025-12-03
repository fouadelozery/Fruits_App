import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/auth/presentation/sign_up_view.dart';
import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SignUpView()),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ليس لديك حساب؟',
            style: TextStyle(
              color: AppColors.shadeColor,
              fontSize: 16,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(width: 3),

          const Text(
            "إنشاء حساب جديد",
            style: TextStyle(
              color: AppColors.lightText,
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
