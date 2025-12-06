import 'package:e_commerce/features/home/presentation/view/widgets/build_appbar.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/personal_profile_body.dart';
import 'package:flutter/material.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key});
  static const String routeName = "PersonalProfile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(
        title: "الملف الشخصي",
        isBackVisible: true,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const PersonalProfileBody(),
    );
  }
}
