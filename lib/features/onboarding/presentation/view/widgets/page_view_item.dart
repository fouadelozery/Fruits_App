import 'package:e_commerce/core/services/shared_perfernces.dart';
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:e_commerce/core/widgets/constant.dart';
import 'package:e_commerce/features/auth/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.subtitle,
    required this.title,
    required this.isVisible,
  });
  final String image;
  final Widget title, subtitle;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    Assets.imagesVector,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SvgPicture.asset(image),
                ),
                Visibility(
                  visible: isVisible,
                  child: GestureDetector(
                    onTap: () {
                      Preferences.setBool(kIsOnboardVisible, true);
                      Navigator.pushReplacementNamed(
                        context,
                        LoginView.routeName,
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20, right: 20),
                      child: Text('تخطي'),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 64),
          title,
          const SizedBox(height: 25),
          subtitle,
        ],
      ),
    );
  }
}
