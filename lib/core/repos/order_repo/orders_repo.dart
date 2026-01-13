import 'package:dartz/dartz.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/features/check_out/domain/entites/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder({required OrderEntity orderEntity});
}
