import 'package:e_commerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:e_commerce/features/home/view/widgets/dummy_product.dart';
import 'package:e_commerce/features/home/view/widgets/most_selling_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MostSellerBlocProvider extends StatelessWidget {
  const MostSellerBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return MostSellingGridView(products: state.products);
          
        } else if (state is ProductError) {
          return SliverToBoxAdapter(
            child: ErrorWidget(state.errorMessage),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: MostSellingGridView(products: getDemoProducts()),
          );
        }
      },
    );
  }
}
