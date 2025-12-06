import 'package:e_commerce/core/helper/get_user.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/widgets/custtom_buttom.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PersonalProfileBody extends StatelessWidget {
  const PersonalProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "المعلومات الشخصية",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontFamily: "Cairo",
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: getUserData().name,
            labelText: "الاسم الكامل",
            suffixIcon: Icon(Icons.edit, color: AppColors.primaryColor),
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: getUserData().email,
            labelText: "الايميل",
            suffixIcon: Icon(Icons.edit, color: AppColors.primaryColor),
          ),
          SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "تعديل كلمة المرور",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontFamily: "Cairo",
              ),
            ),
          ),
          const SizedBox(height: 24),

          CustomTextFormField(
            hintText: "كلمة المرور الحالية",
            labelText: "كلمة المرور الحالية",
            suffixIcon: Icon(
              Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: "كلمة المرور الجديدة",
            labelText: "كلمة المرور الجديدة",
            suffixIcon: Icon(
              Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            hintText: "تأكيد كلمة المرور الجديدة",
            labelText: "تأكيد كلمة المرور الجديدة",
            suffixIcon: Icon(
              Icons.visibility_off,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 42),

          CusttomButtom(text: "حفظ التغيرات", onPressed: () {}),
        ],
      ),
    );
  }
}
