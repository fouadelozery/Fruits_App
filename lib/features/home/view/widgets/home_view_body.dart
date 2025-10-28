import 'package:e_commerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:e_commerce/features/home/view/widgets/feature_list.dart';
import 'package:e_commerce/features/home/view/widgets/home_appbar.dart';
import 'package:e_commerce/features/home/view/widgets/home_search.dart';
import 'package:e_commerce/features/home/view/widgets/most_seller.dart';
import 'package:e_commerce/features/home/view/widgets/most_selling_grid_view.dart';
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
    context.read<ProductCubit>().fetchBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 16),
                HomeAppbar(),
                SizedBox(height: 20),
                HomeSearch(),
                SizedBox(height: 20),
                FeatureList(),
                SizedBox(height: 20),
                MostSeller(),
                SizedBox(height: 20),
              ],
            ),
          ),
          MostSellingGridView(),
        ],
      ),
    );
  }
}
