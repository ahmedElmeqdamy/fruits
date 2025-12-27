import 'package:dartz/dartz.dart';

import '../../entity/product_entity.dart';
import '../../errors/failure.dart';

abstract class ProductRepo{
Future<Either<Failure, List<ProductEntity>>> getProducts();
Future<Either<Failure , List<ProductEntity>>> getBestSellingProducts();

}