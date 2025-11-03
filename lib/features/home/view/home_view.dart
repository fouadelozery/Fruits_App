import 'package:e_commerce/core/cubits/product_cubit/product_cubit.dart';
import 'package:e_commerce/core/repo/product_repo/product_repo.dart';
import 'package:e_commerce/core/services/get_it.dart';
import 'package:e_commerce/features/home/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getIt<ProductRepo>(),
      ),
      child: const HomeViewBody(),
    );
  }
}
