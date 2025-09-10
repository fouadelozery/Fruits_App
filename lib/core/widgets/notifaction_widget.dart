
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NoticationWidget extends StatelessWidget {
  const NoticationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: Colors.white,
      ),
      child: SvgPicture.asset(Assets.imagesNotification),
    );
  }
}