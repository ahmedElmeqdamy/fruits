import 'package:dartz/dartz.dart';

import 'package:fruits/core/errors/failure.dart';

import 'package:fruits/features/check_out/domain/entites/order_entity.dart';

import '../../../features/check_out/data/models/order_models.dart';
import '../../services/database_services.dart';
import '../../services/firestore_services.dart';
import 'orders_repo.dart';

class OrderRepoImpl implements OrderRepo {
  OrderRepoImpl(this.databaseServices);

  final DatabaseServices databaseServices;

  @override
  Future<Either<Failure, void>> addOrder({
    required OrderEntity orderEntity,
  }) async {
    try {
      await databaseServices.addData(
        path: 'orders',
        data: OrderModels.fromEntity(orderEntity: orderEntity).toJson() ,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
