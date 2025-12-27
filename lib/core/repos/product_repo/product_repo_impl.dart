import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruits/core/entity/product_entity.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/core/repos/product_repo/product_repos.dart';

import '../../models/product_model.dart';
import '../../services/database_services.dart';

class ProductRepoImpl implements ProductRepo {
  ProductRepoImpl({required this.databaseServices});

  final DatabaseServices databaseServices;

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    return getProducts(
      query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
    );

    // log("[step 1]", name: "getBestSellingProducts");
    // try {
    //   log("[step 2]", name: "getBestSellingProducts");
    //   final data = await databaseServices.getData(
    //     path: 'products',
    //     query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
    //   );
    //
    //   if (data is List<Map<String, dynamic>>) {
    //     log("[step 3] List<Map<String, dynamic>>", name: "getBestSellingProducts");
    //     final products = data
    //         .map((e) => ProductModel.fromJson(e).toEntity())
    //         .toList();
    //     return Right(products);
    //   } else if (data is Map<String, dynamic>) {
    //     log("[step 3] Map<String, dynamic>", name: "getBestSellingProducts");
    //     final product = ProductModel.fromJson(data).toEntity();
    //     return Right([product]);
    //   } else {
    //     log(
    //       "[step 5 - ERROR]\nunexpected data type, ${data.runtimeType}",
    //       name: "getBestSellingProducts",
    //     );
    //     return Left(ServerFailure('unexpected data type, ${data.runtimeType}'));
    //   }
    // } catch (e) {
    //   log("[step 6 - ERROR]\n$e", name: "getBestSellingProducts");
    //   log('Error is ${e.toString()}');
    //   return Left(ServerFailure(e.toString()));
    // }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({
    String? uid,
    Map<String, dynamic>? query
}) async {
    log("[step 1]", name: "getProducts");
    try {
      log("[step 2]", name: "getProducts");
      final data = await databaseServices.getData(path: 'products', query: query, uid: uid);

      if (data is List<Map<String, dynamic>>) {
        log("[step 3] List<Map<String, dynamic>>", name: "getProducts");
        final products = data
            .map((e) => ProductModel.fromJson(e).toEntity())
            .toList();
        return Right(products);
      } else if (data is Map<String, dynamic>) {
        log("[step 3] Map<String, dynamic>", name: "getProducts");
        final product = ProductModel.fromJson(data).toEntity();
        return Right([product]);
      } else {
        log(
          "[step 5 - ERROR]\nunexpected data type, ${data.runtimeType}",
          name: "getProducts",
        );
        return Left(ServerFailure('unexpected data type, ${data.runtimeType}'));
      }
    } catch (e) {
      log("[step 6 - ERROR]\n$e", name: "getProducts");
      log('Error is ${e.toString()}');
      return Left(ServerFailure(e.toString()));
    }
  }
}
