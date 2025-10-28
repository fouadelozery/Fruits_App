part of 'product_cubit.dart';
abstract class ProductState  {
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductEntity> products;

  ProductSuccess(this.products);

}

class ProductError extends ProductState {
  final String errorMessage;

 ProductError(this.errorMessage);
}
