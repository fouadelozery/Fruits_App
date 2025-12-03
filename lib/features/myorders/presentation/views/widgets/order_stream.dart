import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/utiles/endpoint.dart';
import 'package:e_commerce/features/myorders/domian/models/order_ui_model.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/order_view_state.dart';
import 'package:e_commerce/features/myorders/presentation/views/widgets/orders_list.dart';
import 'package:flutter/material.dart';

class OrdersStream extends StatelessWidget {
  const OrdersStream({super.key, required this.uId});

  final String uId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          FirebaseFirestore.instance
              .collection(Endpoint.addOrder)
              .where('uId', isEqualTo: uId)
              .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const OrdersLoading();
        }

        if (snapshot.hasError) {
          return OrdersError(message: snapshot.error.toString());
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const OrdersEmpty();
        }

        final orders =
            snapshot.data!.docs
                .map(
                  (doc) =>
                      OrderUiModel.fromMap(doc.data() as Map<String, dynamic>),
                )
                .toList();

        return OrdersList(orders: orders);
      },
    );
  }
}
