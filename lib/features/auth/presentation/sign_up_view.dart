import 'package:e_commerce/core/helper/error_widget.dart';
import 'package:e_commerce/core/services/get_it.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/auth/domin/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/sign_up/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'sign_up';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightBackground,
          titleTextStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.lightText,
            fontFamily: 'Cairo',
          ),
          title: const Text('إنشاء حساب جديد'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: AppColors.lightBackground,
        body: Builder(
          builder: (context) {
            return BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state is SignUpLoading) {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder:
                        (context) => Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: AppColors.primaryColor,
                          ),
                        ),
                  );
                } // Close the loading dialog
                else {
                  Navigator.pop(context);
                }
                if (state is SignUpSuccess) {
                  Navigator.pop(context);
                } else if (state is SignUpFailure) {
                  errorWidget(context, state.errorMessage);
                }
              },
              builder: (context, state) {
                return const SignUpViewBody();
              },
            );
          },
        ),
      ),
    );
  }
}
