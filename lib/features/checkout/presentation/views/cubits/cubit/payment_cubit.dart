import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/checkout/data/repo/checkout_repo.dart';
import 'package:e_commerce/features/checkout/domin/models/payment_intent_input_model.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;
  Future<void> makePayment({required PaymentIntentInputModel payment}) async {
    emit(PaymentLoading());
    final result = await checkoutRepo.makePayment(payment: payment);
    result.fold(
      (failure) => emit(PaymentFailure(errorMessage: failure.message)),
      (_) => emit(PaymentSuccess()),
    );
  }
}
