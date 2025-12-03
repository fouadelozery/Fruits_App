import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButtom extends StatelessWidget {
  const SocialButtom({
    super.key,
    required this.image,
    required this.text,
    required this.onPressed,
  });
  final String image, text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.lightBackground, width: 1),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: ListTile(
          visualDensity: const VisualDensity(
            vertical: VisualDensity.minimumDensity,
          ),
          leading: SvgPicture.asset(image),

          title: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.lightText,
              fontSize: 18,
              fontFamily: 'Cairo',
            ),
          ),
        ),
      ),
    );
  }
}
