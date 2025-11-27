import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/core/repo/order_repo/order_repo.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/utiles/endpoint.dart';
import 'package:e_commerce/features/checkout/domin/entities/order_entity.dart';
import 'package:e_commerce/features/checkout/domin/models/order_model.dart';

class OrderRepoImp implements OrderRepo {
  final DatabaseService databaseService;

  OrderRepoImp({required this.databaseService});
  @override
  Future<Either<Failure, void>> addOrder({
    required OrderInputEntity order,
  }) async {
    try {
      databaseService.addData(
        path: Endpoint.addOrder,
        data: OrderModel.fromEntity(order).toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
