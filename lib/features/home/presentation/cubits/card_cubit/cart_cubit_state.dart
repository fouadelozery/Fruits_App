part of 'cart_cubit_cubit.dart';

@immutable
sealed class CartCubitState {}

final class CartCubitInitial extends CartCubitState {}
final class CartCubitAdded  extends CartCubitState {}
final class CartCubitRemoved  extends CartCubitState {}

