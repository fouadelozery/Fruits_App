import 'package:e_commerce/core/helper/snackbar_method.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_order/add_cubit_cubit.dart';

class AddCubitBloc extends StatelessWidget {
  const AddCubitBloc({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          snackBarMethod(context, "تمت العمليه بنجاح");
        }
        if (state is AddOrderFailure) {
          snackBarMethod(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is AddOrderLoading) {
          return Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: AppColors.primaryColor,
            ),
          );
        }
        return widget; //
      },
    );
  }
}
