import 'dart:ui';

import 'package:e_commerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/feature_list.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/home_appbar.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/home_search.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/most_seller.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/products_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchBestSellingProducts();
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
                const SizedBox(height: 16),
                const HomeAppbar(),
                const SizedBox(height: 20),
                HomeSearch(
                  onChanged: (value) {
                    context.read<ProductCubit>().searchProducts(value);
                  },
                ),
                const SizedBox(height: 20),
                const FeatureList(),
                const SizedBox(height: 20),
                const MostSeller(),
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
