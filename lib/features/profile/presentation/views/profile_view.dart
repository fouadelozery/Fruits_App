import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/auth/presentation/cubits/sign_out/sign_out_cubit.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/build_appbar.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = "ProfileView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(title: "حسابي", isBackVisible: true),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => SignOutCubit(),
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
