import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/core/services/strip_service.dart';
import 'package:e_commerce/features/checkout/data/repo/checkout_repo.dart';
import 'package:e_commerce/features/checkout/domin/models/payment_intent_input_model.dart';

class CheckoutRepoImp implements CheckoutRepo {
  final StripService stripService;

  CheckoutRepoImp({required this.stripService});
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel payment,
  }) async {
    try {
      await stripService.makePayment(payment: payment);
      return right(null);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
