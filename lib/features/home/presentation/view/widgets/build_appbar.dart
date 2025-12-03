import 'package:e_commerce/core/widgets/notifaction_widget.dart';
import 'package:flutter/material.dart';

AppBar buildappbar({
  required String title,
  bool isBackVisible = true,
  bool isNotificationVisible = true,
  void Function()? onPressed,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,

    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Visibility(
          visible: isNotificationVisible,
          child: const NoticationWidget(),
        ),
      ),
    ],
    centerTitle: true,
    leading: Visibility(
      visible: isBackVisible,
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(Icons.arrow_back, color: Colors.black),
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
      ),
    ),
    elevation: 0,
  );
}
