import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/product_entity.dart';
import 'package:e_commerce/core/error/failure.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> getProductsByLowestPrice();
  Future<Either<Failure, List<ProductEntity>>> getProductsByHighestPrice();
  Future<Either<Failure, List<ProductEntity>>> getProductsAlphabetically();
}
