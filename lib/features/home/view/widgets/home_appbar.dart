import 'package:e_commerce/core/helper/get_user.dart';
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:e_commerce/core/widgets/notifaction_widget.dart';
import 'package:flutter/material.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset(Assets.imagesProfile),
        ),
        title: const Text(
          'اهلا بك',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Cairo',
          ),
        ),
        subtitle: Row(
          children: [
            const Text(
              "يا",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(width: 3),
            Text(
              getUserFromJson().name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        trailing: const NoticationWidget(),
      ),
    );
  }
}
