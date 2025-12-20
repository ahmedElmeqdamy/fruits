import 'package:dartz/dartz.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
     String email,
     String password,
     String name,
  );

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
     String email,
     String password,
  );

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  // this method is used to add the user data to the database firestore
  Future<dynamic> addUserData({required UserEntity user});


  Future<UserEntity> getUserData({required String uid});

Future<dynamic> saveUserData({required UserEntity user});

}
