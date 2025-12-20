import 'package:fruits/core/services/firestore_services.dart';
import 'package:fruits/features/auth/data/repos/auth_repos_impl.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/domain/repos/auth_repo.dart';
import 'firebase_auth_services.dart';
import 'database_services.dart';

//create method setup to register all dependencies 1-2
final GetIt getIt = GetIt.instance;

void setupGetIt() {
  // Register services
  getIt.registerSingleton<FirebaseAuthServices>(FirebaseAuthServices());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  
  // Register repositories with their dependencies
  getIt.registerSingleton<AuthRepo>(
    AuthReposImpl(
      firebaseAuthServices: getIt<FirebaseAuthServices>(),
      databaseServices: getIt<DatabaseServices>(),
    ),
  );
}
