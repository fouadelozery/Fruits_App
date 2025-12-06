import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/setting_tile.dart';
import 'package:flutter/material.dart';

class SettingsSection extends StatelessWidget {
  final String title;
  final List<SettingsTile> tiles;

  const SettingsSection({super.key, required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontFamily: "Cairo",
            ),
          ),
        ),
        // قائمة الـ Til
        ...tiles,
      ],
    );
  }
}
