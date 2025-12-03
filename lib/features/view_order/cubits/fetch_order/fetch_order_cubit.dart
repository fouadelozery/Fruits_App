import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/core/repo/order_repo/order_repo.dart';
import 'package:e_commerce/features/checkout/domin/models/order_model.dart';

part 'fetch_order_state.dart';

class FetchOrderCubit extends Cubit<FetchOrderState> {
  final OrderRepo orderRepo;

  FetchOrderCubit({required this.orderRepo}) : super(FetchOrderInitial());

  Future<void> fetchOrders(String userId) async {
    emit(FetchOrderLoading());

    final result = await orderRepo.fetchOrder(userId: userId);

    result.fold(
      (failure) => emit(FetchOrderFailure(errorMesage: failure.message)),
      (orders) => emit(FetchOrderSuccess(orders: orders)),
    );
  }
}
