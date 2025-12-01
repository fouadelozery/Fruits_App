import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
        child: Row(
          children: <Widget>[
            // الأيقونة
            Icon(icon, color: AppColors.primaryColor, size: 24),
            const SizedBox(width: 16.0),

            // العنوان (Title)
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                  fontFamily: "Cairo",
                ),
              ),
            ),

            // السهم
            const Icon(
              Icons.arrow_back_ios,
              color: AppColors.primaryColor,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}
