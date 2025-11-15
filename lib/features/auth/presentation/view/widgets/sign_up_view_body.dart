import 'dart:developer';

import 'package:e_commerce/core/helper/error_widget.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/widgets/custtom_buttom.dart';
import 'package:e_commerce/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';

import 'package:e_commerce/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/password_form.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late String name, email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late bool onChange = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),
              CustomTextFormField(
                hintText: 'اسم المستخدم',
                labelText: 'اسم المستخدم',

                onSaved: (value) {
                  name = value!;
                },
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                labelText: 'البريد الإلكتروني',
                hintText: 'البريد الإلكتروني',
                onSaved: (value) {
                  email = value!;
                },

                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 24),
              PasswordForm(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 24),
              TermsAndCondition(
                onchanged: (value) {
                  onChange = value;

                  setState(() {});
                },
              ),
              const SizedBox(height: 24),
              CusttomButtom(
                text: "إنشاء حساب جديد",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (onChange) {
                      log(email);
                      log(password);
                      log(name);
                      context.read<SignUpCubit>().signUp(
                        email: email,
                        password: password,
                        name: name,
                      );
                    } else {
                      errorWidget(
                        context,
                        "يجب عليك الموافقه علي الشروط والاحكام",
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'لديك حساب بالفعل؟',
                    style: TextStyle(
                      color: AppColors.shadeColor,
                      fontSize: 18,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  const SizedBox(width: 3),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
