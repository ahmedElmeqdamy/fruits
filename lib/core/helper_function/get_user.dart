import 'dart:convert';


import '../../features/auth/data/models/user_models.dart';
import '../../features/auth/domain/entities/user_entity.dart';
import '../services/shared_preferences.dart';

UserEntity getUser() {
  var jsonString =  Prefs.getString('userData') as String;
  var userEntity = UserModel.fromJson(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );
  return userEntity;
}
