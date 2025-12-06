import 'package:e_commerce/features/myorders/presentation/views/widgets/my_order_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final String uId = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("طلباتي"))),
      body: MyOrderViewBody(uId: uId),
    );
  }
}
