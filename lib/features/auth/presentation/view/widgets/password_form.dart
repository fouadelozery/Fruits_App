import 'package:e_commerce/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({super.key, this.onSaved});
  final void Function(String?)? onSaved;

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  bool obsecuretext = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obsecureText: obsecuretext,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      suffixIcon: GestureDetector(
        onTap: () {
          obsecuretext = !obsecuretext;
          setState(() {});
        },
        child:
            obsecuretext
                ? const Icon(Icons.remove_red_eye)
                : const Icon(Icons.visibility_off),
      ),
      icon: Icons.password_outlined, labelText: 'كلمة المرور',
    );
  }
}
