import 'package:e_commerce/core/helper/snackbar_method.dart';
import 'package:e_commerce/features/auth/domin/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/sign_out/sign_out_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/login_view.dart';
import 'package:e_commerce/features/myorders/presentation/views/my_order_view.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/logout_button.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/setting_section.dart';
import 'package:e_commerce/features/profile/presentation/views/widgets/setting_tile.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutFailure) {
          snackBarMethod(context, state.errorMessage);
        } else if (state is SignOutSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginView.routeName,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignOutLoading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const ProfileHeader(imageUrl: "assests/images/profileMe.png"),
                const SizedBox(height: 24.0),

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
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const MyOrdersView(),
                          ),
                        );
                      },
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
                      onTap: () {
                        context.read<ThemeCubit>().toggleTheme();
                      },
                    ),
                    SettingsTile(
                      icon: Icons.help_outline,
                      title: 'المساعدة',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Center(
                  child: LogoutButton(
                    onTap: () {
                      BlocProvider.of<SignOutCubit>(context).logout();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
