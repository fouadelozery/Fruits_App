import 'package:e_commerce/core/helper/get_user.dart';
import 'package:e_commerce/core/repo/order_repo/order_repo.dart';
import 'package:e_commerce/core/services/get_it.dart';
import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/presentation/views/cubits/add_order/add_cubit_cubit.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/add_cubit_bloc.dart';
import 'package:e_commerce/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:e_commerce/features/home/domain/entity/cart_entity.dart';
import 'package:e_commerce/features/home/view/widgets/build_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  static const String routeName = "checkoutView";
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt.get<OrderRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildappbar(
          title: "الشحن",
          isNotificationVisible: false,
          onPressed: () {
            return Navigator.pop(context);
          },
        ),
        body: SafeArea(
          child: Provider.value(
            value: OrderEntity(cartEntity, uId: getUserData().uid),
            child: const AddCubitBloc(widget: CheckoutViewBody()),
          ),
        ),
      ),
    );
  }
}
