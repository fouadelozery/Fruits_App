import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// مكان ThemeCubit

class SettingMode extends StatelessWidget {
  const SettingMode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, isDark) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // السويتش على الشمال
            Switch(
              value: isDark,
              onChanged: (_) {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),

            // العنوان
            Text(
              'الوضع',
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),

            // الأيقونة على اليمين
            Icon(Icons.edit_outlined, color: Colors.green.shade700, size: 20),
          ],
        );
      },
    );
  }
}
