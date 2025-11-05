import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/domain/entity/car_entity.dart';
import 'package:e_commerce/features/home/domain/entity/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_cubit_state.dart';

class CartCubitCubit extends Cubit<CartCubitState> {
  CartCubitCubit() : super(CartCubitInitial());
  CartEntity cartEntity = CartEntity(carItem: []);
  void addCardItem(CarItemEntity carItemEntity) {
    cartEntity.addItemCart(carItemEntity);
    emit(CartCubitAdded());
  }
}
