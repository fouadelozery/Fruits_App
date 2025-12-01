import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/home/view/widgets/build_appbar.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const String routeName = "ProfileView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(title: "حسابي", isBackVisible: true),
      body: const SafeArea(child: ProfileViewBody()),
    );
  }
}
