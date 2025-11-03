import 'package:e_commerce/core/widgets/custtom_buttom.dart';
import 'package:e_commerce/features/home/view/widgets/build_appbar.dart';
import 'package:e_commerce/features/home/view/widgets/card_item.dart';
import 'package:e_commerce/features/home/view/widgets/card_view_list.dart';
import 'package:flutter/material.dart';

class CardViewBody extends StatelessWidget {
  const CardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  buildappbar(title: "السله", isNotificationVisible: false),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    color: Colors.grey,
                    alignment: Alignment.center,

                    child: const Text(
                      "لديك 0 منتجات في السله",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
            const CardViewList(cardItem: []),
          ],
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * .07,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: CusttomButtom(text: "الدفع ب 150", onPressed: () {}),
          ),
        ),
      ],
    );
  }
}
