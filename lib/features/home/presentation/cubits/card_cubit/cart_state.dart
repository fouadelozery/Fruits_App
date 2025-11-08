part of 'cart_cubit.dart';

@immutable
sealed class CartCubitState {}

final class CartCubitInitial extends CartCubitState {}

final class CartProductAdded extends CartCubitState {}

final class CartProductRemoved extends CartCubitState {}
final class CartProductQuantityIncreased extends CartCubitState {}
final class CartProductQuantityDecreased extends CartCubitState {}
