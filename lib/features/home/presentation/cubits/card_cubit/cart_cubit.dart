import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/entities/product_entity.dart';

import 'package:e_commerce/features/home/domain/entity/cart_entity.dart';
import 'package:flutter/material.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  CartCubit() : super(CartCubitInitial());
  CartEntity cartEntity = CartEntity(carItem: []);
  void addProductToCart(ProductEntity productEntity) {
    bool isExist = cartEntity.isExist(productEntity);
    var carItemEntity = cartEntity.getCarItemByProduct(productEntity);
    if (isExist) {
      carItemEntity.count += 1;
    } else {
      cartEntity.addProduct(carItemEntity);
    }

    emit(CartProductAdded());
  }

  void increaseProductQuantity(ProductEntity productEntity) {
    bool isExist = cartEntity.isExist(productEntity);
    if (isExist) {
      var carItemEntity = cartEntity.getCarItemByProduct(productEntity);
      carItemEntity.count += 1;
      emit(CartProductQuantityIncreased());
    }
  }

  void decreaseProductQuantity(ProductEntity productEntity) {
    bool isExist = cartEntity.isExist(productEntity);
    if (isExist) {
      var carItemEntity = cartEntity.getCarItemByProduct(productEntity);
      if (carItemEntity.count > 1) {
        carItemEntity.count -= 1;
      } else {
        cartEntity.carItem.remove(carItemEntity);
      }
      emit(CartProductQuantityDecreased());
    }
  }

  void removeProductFromCart(ProductEntity productEntity) {
    var carItemEntity = cartEntity.getCarItemByProduct(productEntity);

    cartEntity.carItem.remove(carItemEntity);

    emit(CartProductRemoved());
  }
}
