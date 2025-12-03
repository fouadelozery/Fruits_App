import 'dart:developer';
import 'package:e_commerce/core/helper/snackbar_method.dart';
import 'package:e_commerce/core/utiles/app_key.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/core/widgets/custtom_buttom.dart';
import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domin/entities/pay_payment_entity/pay_payment_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/cubits/add_order/add_cubit_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_page_view.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:e_commerce/features/home/presentation/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier = ValueNotifier(
    AutovalidateMode.disabled,
  );

  int currentPageNumber = 0;
  final GlobalKey<FormState> globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    pageController =
        PageController()..addListener(() {
          setState(() {
            currentPageNumber = pageController.page!.toInt();
          });
        });
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),

          CheckoutSteps(
            onTap: (index) {
              if (currentPageNumber == 0) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                );
              } else if (index == 1) {
                final orderEntity =
                    context.read<OrderInputEntity?>(); // SAFE READ

                if (orderEntity == null) {
                  snackBarMethod(context, "خطأ في بيانات الطلب");
                  return;
                }

                if (orderEntity.payByCash != null) {
                  pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                } else {
                  snackBarMethod(context, "يرجي اختيار طريقة الدفع");
                }
              } else {
                _handleAddressingValidation();
              }
            },
            pageController: pageController,
            currentStep: currentPageNumber,
          ),

          Expanded(
            child: CheckoutPageView(
              pageController: pageController,
              globalKey: globalKey,
              valueListenable: valueNotifier,
            ),
          ),

          // Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CusttomButtom(
              text: currentPageNumber == 2 ? "ادفع" : "التالي",
              onPressed: () {
                if (currentPageNumber == 0) {
                  _handleShippingValidation();
                } else if (currentPageNumber == 1) {
                  _handleAddressingValidation();
                } else {
                  final orderEntity =
                      context.read<OrderInputEntity>(); // SAFE READ

                  context.read<AddOrderCubit>().addOrder(order: orderEntity);
                  _handlePayment();
                }
              },
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height * .02),
        ],
      ),
    );
  }

  // ---------------------- LOGIC -------------------------

  void _handleShippingValidation() {
    pageController.animateToPage(
      currentPageNumber + 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handleAddressingValidation() {
    if (globalKey.currentState!.validate()) {
      globalKey.currentState!.save();
      pageController.animateToPage(
        currentPageNumber + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _handlePayment() {
    final orderEntity = context.read<OrderInputEntity?>(); // SAFE READ

    if (orderEntity == null) {
      snackBarMethod(context, "لا يمكن إتمام الدفع: بيانات الطلب غير موجودة");
      return;
    }

    final payPaymentEntity = PayPaymentEntity.fromEntity(orderEntity);
    log(payPaymentEntity.toJson().toString());

    final addOrderCubit = context.read<AddOrderCubit>();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (_) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: clientId,
              secretKey: secretKey,
              transactions: [payPaymentEntity.toJson()],
              note: "Contact us for any questions on your order.",

              onSuccess: (Map params) async {
                addOrderCubit.addOrder(order: orderEntity);

                Navigator.popUntil(
                  context,
                  ModalRoute.withName(MainView.routeName),
                );
                snackBarMethod(context, "تمت العملية بنجاح");
              },

              onError: (error) {
                Navigator.pop(context);
                log(error.toString());
              },

              onCancel: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.primaryColor,
                    content: const Center(
                      child: Text(
                        "تعذر الدفع",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    duration: const Duration(seconds: 4),
                  ),
                );
              },
            ),
      ),
    );
  }
}
