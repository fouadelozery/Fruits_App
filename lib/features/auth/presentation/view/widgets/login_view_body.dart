import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:e_commerce/core/widgets/custtom_buttom.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/dont_have_account.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/or_widget.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/password_form.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/social_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email, password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late bool onChange = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 32),
              CustomTextFormField(
                labelText: "الايميل",
                onSaved: (value) {
                  email = value!;
                },
                hintText: "الايميل",
                icon: Icons.email_outlined,
              ),
              const SizedBox(height: 24),
              PasswordForm(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "هل نسيت كلمة المرور؟",
                  style: TextStyle(
                    color: AppColors.shadeColor,
                    fontSize: 16,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CusttomButtom(
                text: "تسجيل الدخول",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().signIn(email, password);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),

              const SizedBox(height: 32),
              const DontHaveAccount(),
              const SizedBox(height: 32),
              const OrWidget(),
              const SizedBox(height: 32),
              SocialButtom(
                image: Assets.imagesGeogle,
                text: "تسجيل بواسطة جوجل",
                onPressed: () {
                  // context.read<LoginCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(height: 28),
              SocialButtom(
                image: Assets.imagesIphone,
                text: "تسجيل بواسطة أبل",
                onPressed: () {},
              ),
              const SizedBox(height: 28),
              SocialButtom(
                image: Assets.imagesFace,
                text: "تسجيل بواسطة فيسبوك",
                onPressed: () {
                  context.read<LoginCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
