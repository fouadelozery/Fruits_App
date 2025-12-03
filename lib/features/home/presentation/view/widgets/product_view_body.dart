import 'package:e_commerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/build_appbar.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/home_search.dart';

import 'package:e_commerce/features/home/presentation/view/widgets/products_bloc_provider.dart';

import 'package:e_commerce/features/home/presentation/view/widgets/product_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                buildappbar(title: "المنتجات"),
                const SizedBox(height: 16),

                const HomeSearch(),
                const SizedBox(height: 20),
                ProductHeader(
                  productLength: context.watch<ProductCubit>().productLength,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const ProductsBlocProvider(),
        ],
      ),
    );
  }
}
