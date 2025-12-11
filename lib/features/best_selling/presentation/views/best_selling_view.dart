import 'package:e_commerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:e_commerce/core/repo/product_repo/product_repo.dart';
import 'package:e_commerce/core/services/get_it.dart';
import 'package:e_commerce/features/best_selling/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => ProductCubit(getIt.get<ProductRepo>()),
        child: const BestSellingViewBody(),
      ),
    );
  }
}
