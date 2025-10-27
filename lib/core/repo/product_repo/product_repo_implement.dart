import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/add_product_entity.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/core/repo/product_repo/product_repo.dart';

class ProductRepoImplement  implements ProductRepo {
  @override
  Future<Either<Failure, List<AddProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AddProductEntity>>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}