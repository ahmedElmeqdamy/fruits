import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_entity.dart';
//same......................................................
class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uid});

  //this factory method is used to convert the user object from firebase to user entity
  factory UserModel.fromFirebase(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }

  //this factory method is used to convert the user object from firestore to user entity
  //we use the same key of toMap method
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      uid: json['uid'] as String,
    );
  }

  factory UserModel.fromEntity( {required UserEntity userEntity}) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      uid: userEntity.uid,
    );
  }

  // this method is used to convert the user entity to map to add it to the database specific firestore

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uid': uid};
  }
}
