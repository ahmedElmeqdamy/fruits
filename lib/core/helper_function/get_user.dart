import 'dart:convert';

import '../../features/auth/data/models/user_models.dart';
import '../../features/auth/domain/entities/user_entity.dart';
import '../services/shared_preferences.dart';

UserEntity getUser() {
  final jsonString = Prefs.getString('userData');
  final userEntity = UserModel.fromMap(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );
  return userEntity;
}
