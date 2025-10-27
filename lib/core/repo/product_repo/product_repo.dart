import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/entities/add_product_entity.dart';
import 'package:e_commerce/core/error/failure.dart';

  abstract class ProductRepo {
  Future <Either<Failure,List<AddProductEntity>>> getProducts();
    Future <Either<Failure,List<AddProductEntity>>> getBestSellingProducts();


  }
