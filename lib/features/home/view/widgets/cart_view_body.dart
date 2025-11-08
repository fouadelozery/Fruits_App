import 'package:e_commerce/core/widgets/custtom_buttom.dart';
import 'package:e_commerce/features/home/presentation/cubits/card_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/view/widgets/build_appbar.dart';
import 'package:e_commerce/features/home/view/widgets/card_header.dart';
import 'package:e_commerce/features/home/view/widgets/cart_view_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartCubitState>(
      builder: (context, state) {
        final cart = context.read<CartCubit>().cartEntity;

        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      buildappbar(title: "السله", isNotificationVisible: false),
                      const SizedBox(height: 20),
                      const CartHeader(),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),

                cart.carItem.isEmpty
                    ? const SliverToBoxAdapter(child: SizedBox())
                    : CartViewList(cardItem: cart.carItem),
              ],
            ),

            Positioned(
              bottom: MediaQuery.sizeOf(context).height * .07,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child:
                    context.watch<CartCubit>().cartEntity.carItem.isEmpty
                        ? const SizedBox()
                        : CusttomButtom(
                          text:
                              "الدفع  ${context.watch<CartCubit>().cartEntity.calculateTotalPrice().toStringAsFixed(0)} جنيه",
                          onPressed: () {},
                        ),
              ),
            ),
          ],
        );
      },
    );
  }
}
