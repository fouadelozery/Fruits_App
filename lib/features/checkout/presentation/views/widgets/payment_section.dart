import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const PaymentItem(
              title: "ملخص الطلب:",
              widget: Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "المجموع الفرعي:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("\$150.00", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("الشحن", style: TextStyle(fontSize: 16)),
                      Text("\$10.00", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Divider(endIndent: 12, indent: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "الإجمالي",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "\$160.00",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            PaymentItem(
              title: "يرجي تاكيد طلبك ",
              widget: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        "طريقة الدفع:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "تعديل",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "6257 **** **** ****",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
