import 'package:e_commerce/core/helper/error_widget.dart';
import 'package:e_commerce/core/services/get_it.dart';
import 'package:e_commerce/features/auth/domin/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/login/login_cubit.dart';
import 'package:e_commerce/features/home/view/main_view.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'تسجيل الدخول',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Cairo',
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder:
                    (_) => const Center(child: CircularProgressIndicator()),
              );
            } else {
              // Close loading dialog if open
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            }

            if (state is LoginSucces) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MainView()),
              );
            } else if (state is LoginFailure) {
              errorWidget(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return const LoginViewBody();
          },
        ),
      ),
    );
  }
}
