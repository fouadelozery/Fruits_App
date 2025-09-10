import 'package:e_commerce/core/widgets/notifaction_widget.dart';
import 'package:flutter/material.dart';

AppBar buildappbar() {
  return AppBar(
    backgroundColor: Colors.transparent,

    actions: const [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: NoticationWidget(),
      ),
    ],
    centerTitle: true,
    title: const Text(
      'الأكثر مبيعاً',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.w700,
      ),
    ),
    elevation: 0,
  );
}
