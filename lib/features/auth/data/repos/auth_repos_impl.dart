import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits/core/errors/failure.dart';
import 'package:fruits/features/auth/domain/entities/user_entity.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/services/database_services.dart';
import '../../../../core/services/firebase_auth_services.dart';
import '../../../../core/services/shared_preferences.dart';
import '../../domain/repos/auth_repo.dart';
import '../models/user_models.dart';

class AuthReposImpl extends AuthRepo {
  AuthReposImpl({
    required this.firebaseAuthServices,
    required this.databaseServices,
  });
final FirebaseAuthServices firebaseAuthServices;
final DatabaseServices databaseServices;


  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userEntity = UserEntity(name: name, email: email, uid: user.uid);
      await addUserData(user: userEntity);
      //await databaseServices.addData(path: 'users', data: userEntity.toMap());
      return right(userEntity);
    } on CustomException catch (error) {
      await deleteUser(user);
      return left(ServerFailure(error.toString()));
    } catch (error) {
      await deleteUser(user);
      log(
        'Exception in AuthReposImpl.createUserWithEmailAndPassword ${error.toString()}',
      );
      return left(ServerFailure(error.toString()));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //this line is used to fetch data from the database
      final userEntity = await getUserData(uid: user.uid);
      //this line is used to save the user data to the shared preferences local storage
      saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (error) {
      return left(ServerFailure(error.toString()));
    } catch (error) {
      log(
        'Exception in AuthReposImpl.signInWithEmailAndPassword ${error.toString()}',
      );
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithGoogle();
      final userEntity = UserModel.fromFirebase(user);

      final isUserExist = await databaseServices.isDataExit(
        path: 'users',
        uid: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
        log('getUserData');
      } else {
        await addUserData(user: userEntity);
        log('addUserData');
      }
      return right(userEntity);
    } on CustomException catch (error) {
      await deleteUser(user);
      return left(ServerFailure(error.toString()));
    } catch (error) {
      log('Exception in AuthReposImpl.signInWithGoogle ${error.toString()}');
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthServices.signInWithFacebook();

      final userEntity = UserModel.fromFirebase(user);

      final isUserExist = await databaseServices.isDataExit(
        path: 'users',
        uid: user.uid,
      );
      if (isUserExist) {
        await getUserData(uid: user.uid);
        log('getUserData');
      } else {
        await addUserData(user: userEntity);
        log('addUserData');
      }
      return right(userEntity);
    } on CustomException catch (error) {
      await deleteUser(user);
      return left(ServerFailure(error.toString()));
    } catch (error) {
      await deleteUser(user);
      log('Exception in AuthReposImpl.signInWithFacebook ${error.toString()}');
      return left(ServerFailure(error.toString()));
    }
  }


  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseServices.getData(path: 'users', uid: uid);
    return UserModel.fromJson(userData as Map<String, dynamic>) ;
  }

  // this method is used to save the user data to the shared preferences local storage
  @override
  Future  saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(
      UserModel.fromEntity(userEntity: user).toMap(),);

    await Prefs.setString('userData', jsonData);
  }


  @override
   Future  addUserData({required UserEntity user}) async {
    // api firestore any data base treat with map not object so we put method toMap
    // add data to firestore
    await databaseServices.addData(
      path: 'users',
      data: UserModel.fromEntity(userEntity: user).toMap(),
      documentId: user.uid,
    );
  }


  // @override
  // Future saveUserData({required UserEntity user}) async {
  //   var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
  //   await Prefs.setString(kUserData, jsonData);
  // }
}
