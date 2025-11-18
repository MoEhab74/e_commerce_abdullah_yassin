
import 'package:e_commerce/core/api/dio_helper.dart';
import 'package:e_commerce/features/auth/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setUpServiceLocator() {
  locator.registerLazySingleton<DioHelper>(() => DioHelper());
  locator.registerLazySingleton<AuthRepo>(() => AuthRepo(locator<DioHelper>()));
}