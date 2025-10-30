import 'package:e_commerce/core/utiles/flutter_assets.dart';

class ButtomNavigationEntity {
  final String activeImage, inActiveImage;
  final String name;

  ButtomNavigationEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<ButtomNavigationEntity> get buttomNavigationItems => [
  ButtomNavigationEntity(
    activeImage: Assets.imagesVuesaxBoldHome,
    inActiveImage: Assets.imagesVuesaxOutlineHome,
    name: "الرئيسية",
  ),
  ButtomNavigationEntity(
    activeImage: Assets.imagesVuesaxBoldProducts,
    inActiveImage: Assets.imagesVuesaxOutlineProducts,
    name: "المنتجات",
  ),
  ButtomNavigationEntity(
    activeImage: Assets.imagesVuesaxBoldShoppingCart,
    inActiveImage: Assets.imagesVuesaxOutlineShoppingCart,
    name: "عربة التسوق",
  ),
  ButtomNavigationEntity(
    activeImage: Assets.imagesVuesaxBoldUser,
    inActiveImage: Assets.imagesVuesaxOutlineUser,
    name: "الحساب",
  ),
];
