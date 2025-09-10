import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, this.icon, this.suffixIcon, this.onSaved,  this.obsecureText = false});
  final String hintText;
  final IconData? icon;
final Widget? suffixIcon;
   final void Function(String?)? onSaved; 
   final bool  obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText ,
      onSaved: onSaved ,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        
        suffixIcon: suffixIcon ,
        prefixIcon: Icon(icon, color: AppColors.primaryColor),
        border: customBorder(),
        enabledBorder: customBorder(),

        hintText: hintText,
      ),
      style: const TextStyle(fontSize: 18, color: Colors.black, fontFamily: 'Cairo'),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      keyboardAppearance: Brightness.light,
    );
  }

  OutlineInputBorder customBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color:Color(0xffdcdede), width: 1.0),

      borderRadius: BorderRadius.circular(8.0),
    );
  }
}
