import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper_function/box_error.dart';
import 'package:fruits/features/check_out/presentation/manager/add_order_cubit/add_order_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../manager/add_order_cubit/add_order_state.dart';
import 'checkout_view_body.dart';

class CheckoutViewBodyBlocBuilder extends StatelessWidget {
  const CheckoutViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailure) {
          ShowBoxError.show(context, state.errorMessage);
        }
        if (state is AddOrderSuccess) {
          ShowBoxError.show(context, 'order added successfully' );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is AddOrderLoading,
            child: CheckoutViewBody());
      },
    );
  }
}
