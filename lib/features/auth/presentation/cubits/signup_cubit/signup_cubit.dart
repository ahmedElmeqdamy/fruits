import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/features/auth/domain/repos/auth_repo.dart';
import 'package:fruits/features/auth/presentation/cubits/signup_cubit/signup_states.dart';
//second create cubit 2-5
class SignupCubit extends Cubit<SignUpState> {
  SignupCubit(this.authRepo) : super(SignUpInitial());
  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    emit(SignUpLoading());
    final result = await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold((failure){
      emit(SignUpFailure(failure.message));
    }, (userEntity){
      emit(SignUpSuccess(userEntity));
    });


  }
}
