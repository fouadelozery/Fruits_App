import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/utiles/endpoint.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_status_view.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_stream.dart';
import 'package:flutter/material.dart';

class MyOrderViewBody extends StatelessWidget {
  const MyOrderViewBody({super.key, required this.uId});

  final String uId;

  @override
  Widget build(BuildContext context) {
    return OrdersStream(uId: uId);
  }
}
