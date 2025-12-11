import 'package:dio/dio.dart';
import 'package:e_commerce/core/services/api_services.dart';
import 'package:e_commerce/core/utiles/app_key.dart';
import 'package:e_commerce/features/checkout/domin/models/payment_intent_input_model.dart';
import 'package:e_commerce/features/checkout/domin/models/payment_intent_model/payment_intent_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripService {
  final ApiServices apiServices;

  StripService({required this.apiServices});
  Future<PaymentIntentModel> createPaymentIntentParams(
    PaymentIntentInputModel payment,
  ) async {
    var response = await apiServices.postData(
      url: 'https://api.stripe.com/v1/payment_intents',
      ContentType: Headers.formUrlEncodedContentType,
      body: payment.toJson(),
      token: token,
    );
    var paymentIntent = PaymentIntentModel.fromJson(response.data);
    return paymentIntent;
  }

  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Fouad',
      ),
    );
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required PaymentIntentInputModel payment}) async {
    try {
      PaymentIntentModel paymentIntent = await createPaymentIntentParams(
        payment,
      );
      await initPaymentSheet(
        paymentIntentClientSecret: paymentIntent.clientSecret!,
      );
      await presentPaymentSheet();
    } catch (e) {
      rethrow;
    }
  }
}
