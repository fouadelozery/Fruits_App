import 'package:e_commerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:e_commerce/core/utiles/colors.dart';
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

                HomeSearch(
                  onChanged: (value) {
                    context.read<ProductCubit>().searchProducts(value);
                  },
                ),
                const SizedBox(height: 20),
                ProductHeader(
                  productLength: context.watch<ProductCubit>().productLength,
                  onFilterPressed: _showFilterSheet,
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

  void _showFilterSheet() {
    showModalBottomSheet(
      backgroundColor: AppColors.lightPrimary,
      isScrollControlled: true,
      context: context,
      builder:
          (_) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ), // Lowest → Highest
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Price: Low to High",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
                onTap: () {
                  context.read<ProductCubit>().sortByLowestPrice();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ), // Highest → Lowest
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Price: High to Low",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
                onTap: () {
                  context.read<ProductCubit>().sortByHighestPrice();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.sort_by_alpha,
                  color: Colors.white,
                ), // Alphabetical
                title: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Alphabetically (A-Z)",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
                onTap: () {
                  context.read<ProductCubit>().sortAlphabetically();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }
}
