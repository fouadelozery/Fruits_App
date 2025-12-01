import 'package:e_commerce/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/setting_section.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/setting_tile.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // الجزء العلوي (Header)
          const ProfileHeader(
            imageUrl: "assests/images/profileMe.png", // قم بتغيير هذا الرابط
          ),
          const SizedBox(height: 24.0),

          // قسم الإعدادات (Section: عام)
          SettingsSection(
            title: 'عام',
            tiles: [
              SettingsTile(
                icon: Icons.person_outline,
                title: 'الملف الشخصي',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.shopping_bag_outlined,
                title: 'طلباتي',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.credit_card_outlined,
                title: 'المدفوعات',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.favorite_border,
                title: 'المفضلة',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.notifications_none,
                title: 'الإشعارات',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.language_outlined,
                title: 'اللغة',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.dark_mode_outlined,
                title: 'الوضع',
                onTap: () {},
              ),
              SettingsTile(
                icon: Icons.help_outline,
                title: 'المساعدة',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 50),
          Center(child: LogoutButton(onTap: () {})),
          // زر تسجيل الخروج
        ],
      ),
    );
  }
}
