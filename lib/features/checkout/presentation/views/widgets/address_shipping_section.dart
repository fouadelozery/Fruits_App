import 'package:e_commerce/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressShippingSection extends StatelessWidget {
  const AddressShippingSection({
    super.key,
    required this.globalKey,
    required this.valueListenable,
  });
  final GlobalKey<FormState> globalKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: ValueListenableBuilder(
          valueListenable: valueListenable,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return Form(
              key: globalKey,
              autovalidateMode: value,
              child: Column(
                children: [
                  const SizedBox(height: 36),
                  CustomTextFormField(
                    hintText: "الاسم",
                    labelText: "الاسم",
                    onSaved: (value) {
                      context
                          .read<OrderEntity>()
                          .addressingShippingEntity
                          .fullName = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: "رقم الهاتف",
                    labelText: "الهاتف",
                    onSaved: (value) {
                      context
                          .read<OrderEntity>()
                          .addressingShippingEntity
                          .phoneNumber = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: "الايميل",
                    labelText: "الايميل",
                    onSaved: (value) {
                      context
                          .read<OrderEntity>()
                          .addressingShippingEntity
                          .email = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: "العنوان",
                    labelText: "العنوان",
                    onSaved: (value) {
                      context
                          .read<OrderEntity>()
                          .addressingShippingEntity
                          .address = value!;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: "المدينة",
                    labelText: "المدينة",
                    onSaved: (value) {
                      context
                          .read<OrderEntity>()
                          .addressingShippingEntity
                          .city = value!;
                    },
                  ),

                  const SizedBox(height: 20),
                  CustomTextFormField(
                    hintText: "رقم الشقه",
                    labelText: "رقم الشقه",
                    onSaved: (value) {
                      context
                          .read<OrderEntity>()
                          .addressingShippingEntity
                          .floor = value;
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
