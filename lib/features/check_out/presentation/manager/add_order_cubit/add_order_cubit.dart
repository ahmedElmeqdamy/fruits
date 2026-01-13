


import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/repos/order_repo/orders_repo.dart';
import '../../../domain/entites/order_entity.dart';
import 'add_order_state.dart';


class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
final OrderRepo orderRepo;


void addOrder({required OrderEntity orderEntity}) async {
  emit(AddOrderLoading());
  final result = await orderRepo.addOrder(orderEntity: orderEntity);
  result.fold((failure) => emit(AddOrderFailure(failure.message)),
          (success) => emit(AddOrderSuccess()));
}


}
