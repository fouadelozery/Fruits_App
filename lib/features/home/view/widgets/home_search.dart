import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          suffixIcon: SizedBox(
            width: 30,
            child: Center(child: SvgPicture.asset(Assets.imagesSetting4)),
          ),
          prefixIcon: const Icon(Icons.search,size: 30, color: AppColors.primaryColor),
          border: customBorder(),
          enabledBorder: customBorder(),

          hintText: "ابحث عن .........",
        ),
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Cairo',
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        keyboardAppearance: Brightness.light,
      ),
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),

      borderRadius: BorderRadius.circular(8.0),
    );
  }
}
