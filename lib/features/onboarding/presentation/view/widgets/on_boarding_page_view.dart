import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:e_commerce/features/onboarding/presentation/view/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.controller});
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        PageViewItem(
          isVisible: true, // Always visible for the first page
          image: Assets.imagesFruit,

          subtitle: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              "نقدم لكم تطبيقًا  لعرض وبيع الفواكه،حيث يجمع بين سهولة الاستخدام والتصميم الأنيق. يتيح التطبيق تصفح مجموعة متنوعة من الفواكه مع تفاصيل كاملة عن كل منتج مثل الاسم، السعر، الوزن، الصورة مع إمكانية إضافة المنتجات إلى السلة وإتمام عملية الشراء بسهولة.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'مرحبا بك في',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                  fontFamily: 'Cairo',
                ),
              ),
              const SizedBox(width: 3),

              const Text(
                "App",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,

                  fontFamily: 'Cairo',
                ),
              ),
              const SizedBox(width: 3),
              Text(
                "Fruits",
                style: TextStyle(
                  fontSize: 24,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,

                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
        ),
        const PageViewItem(
          isVisible: false, // Not visible for the second page
          image: Assets.imagesImagefruit2,

          subtitle: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "نقدم لكم تطبيق الفواكه، وهو تطبيق بسيط وعملي لعرض أنواع الفواكه مع صورها، أسعارها، وفوائدها الغذائية. يمكن للمستخدم تصفح قائمة الفواكه، البحث عن فاكهة معينة، وإضافتها إلى المفضلة لحفظها والرجوع إليها لاحقًا.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,

                fontFamily: 'Cairo',
              ),
            ),
          ),

          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ابحث وتسوق',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,

                  fontFamily: 'Cairo',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
