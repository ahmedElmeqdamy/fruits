import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/cubits/product_cubit/product_state.dart';
import 'package:fruits/core/repos/product_repo/product_repos.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductError(errorMessage: failure.message)),
      (products) => emit(ProductSuccess(products: products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductError(errorMessage: failure.message)),
      (products) => emit(ProductSuccess(products: products)),
    );
  }
}
