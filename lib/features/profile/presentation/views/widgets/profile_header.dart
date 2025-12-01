import 'package:e_commerce/core/helper/get_user.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String imageUrl;

  const ProfileHeader({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey[50], // لون خلفية خفيف لإبراز هذا القسم
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: <Widget>[
          // تفاصيل الاسم والبري
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  getUserData().name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  (getUserData().email).toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),

          // الصورة الشخصية
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(imageUrl),
                backgroundColor: Colors.grey.shade200,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
