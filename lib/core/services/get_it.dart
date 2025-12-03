import 'package:e_commerce/core/repo/order_repo/order_repo.dart';
import 'package:e_commerce/core/repo/order_repo/order_repo_imp.dart';
import 'package:e_commerce/core/repo/product_repo/product_repo.dart';
import 'package:e_commerce/core/repo/product_repo/product_repo_implement.dart';
import 'package:e_commerce/core/services/database_service.dart';
import 'package:e_commerce/core/services/fire_store_services.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/features/auth/domin/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/domin/repo/auth_repo_imp.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DatabaseService>(FireStoreServices());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
  getIt.registerSingleton<ProductRepo>(ProductRepoImplement());
  getIt.registerSingleton<OrderRepo>(
    OrderRepoImp(databaseService: getIt<DatabaseService>()),
  );
}
