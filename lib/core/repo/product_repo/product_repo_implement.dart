import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/core/models/product_model.dart';
import 'package:e_commerce/core/repo/product_repo/product_repo.dart';

import 'package:e_commerce/core/services/fire_store_services.dart';
import 'package:e_commerce/core/utiles/endpoint.dart';

class ProductRepoImplement implements ProductRepo {
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      final databaseService = FireStoreServices();

      var data =
          await databaseService.getData(
                path: Endpoint.getProducts,
                query: {
                  'orderBy': 'countSold',
                  'descending': true,
                  'limit': 10,
                },
              )
              as List<Map<String, dynamic>>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> entityProducts =
          products.map((e) => e.toEntity()).toList();
      return Right(entityProducts);
    } catch (e) {
      return Left(ServerFailure(message: "Failed to fetch products: $e"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final databaseService = FireStoreServices();

      var data =
          await databaseService.getData(path: Endpoint.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> entityProducts =
          products.map((e) => e.toEntity()).toList();
      return Right(entityProducts);
    } catch (e) {
      return Left(ServerFailure(message: "Failed to fetch products: $e"));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
  getProductsByLowestPrice() async {
    final result = await getProducts();
    return result.fold((failure) => Left(failure), (products) {
      products.sort((a, b) => a.price.compareTo(b.price));
      return Right(products);
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
  getProductsByHighestPrice() async {
    final result = await getProducts();
    return result.fold((failure) => Left(failure), (products) {
      products.sort((a, b) => b.price.compareTo(a.price));
      return Right(products);
    });
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
  getProductsAlphabetically() async {
    final result = await getProducts();
    return result.fold((failure) => Left(failure), (products) {
      products.sort((a, b) => a.name.compareTo(b.name));
      return Right(products);
    });
  }
}
