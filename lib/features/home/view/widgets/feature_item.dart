import 'package:e_commerce/core/utiles/flutter_assets.dart';
import 'package:e_commerce/features/home/view/widgets/feature_item_buttom.dart';
import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  const FeatureItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width - 32,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                right: MediaQuery.sizeOf(context).width * 0.45,
                child: Image.asset(Assets.imagesItem, fit: BoxFit.fill),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.imagesShapeDarkBlue),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 26),
                      const Text(
                        'عروض رمضان',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Cairo",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "خصم 25% ",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Cairo",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 14),

                      FeatureItemButtom(onPressed: () {}),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
