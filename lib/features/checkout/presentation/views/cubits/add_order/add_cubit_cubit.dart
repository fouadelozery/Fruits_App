import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/repo/order_repo/order_repo.dart';
import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:meta/meta.dart';

part 'add_cubit_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;
  addOrder({required OrderInputEntity order}) async {
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(order: order);
    result.fold(
      ((failure) => emit(AddOrderFailure(errorMessage: failure.message))),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
