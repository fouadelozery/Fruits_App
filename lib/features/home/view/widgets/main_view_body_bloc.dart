import 'package:e_commerce/core/helper/snackbar_method.dart';
import 'package:e_commerce/features/home/presentation/cubits/card_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/view/widgets/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBloc extends StatelessWidget {
  const MainViewBodyBloc({
    super.key,
    required this.currentIndex,
    required this.views,
  });

  final int currentIndex;
  final List<Widget> views;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<CartCubit, CartCubitState>(
        listener: (context, state) {
          if (state is CartProductAdded) {
            snackBarMethod(context, 'Product added to cart');
          }
          if (state is CartProductRemoved) {
            snackBarMethod(context, 'Product removed from cart');
          }
          if (state is CartProductQuantityIncreased) {
          } else if (state is CartProductQuantityDecreased) {}
        },
        child: MainViewBody(currentIndex: currentIndex, views: views),
      ),
    );
  }
}
