import 'package:e_commerce/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddressShippingSection extends StatelessWidget {
  const AddressShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 36),
            CustomTextFormField(hintText: "الاسم", labelText: "الاسم"),
            SizedBox(height: 20),
            CustomTextFormField(hintText: "رقم الهاتف", labelText: "الهاتف"),
            SizedBox(height: 20),
            CustomTextFormField(hintText: "الايميل", labelText: "الايميل"),
            SizedBox(height: 20),
            CustomTextFormField(hintText: "العنوان", labelText: "العنوان"),
            SizedBox(height: 20),
            CustomTextFormField(hintText: "المدينة", labelText: "المدينة"),
            SizedBox(height: 20),
            CustomTextFormField(hintText: "رقم الشقه", labelText: "رقم الشقه"),
          ],
        ),
      ),
    );
  }
}
