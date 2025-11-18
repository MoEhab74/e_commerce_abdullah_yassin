import 'package:e_commerce/core/api/dio_helper.dart';
import 'package:e_commerce/features/auth/repo/auth_repo.dart';
import 'package:e_commerce/features/auth/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
// All Dependencies over the app are registered here
void setUpServiceLocator() {
  // LazySingleton ===> Single instance throughout the app lifecycle,
  // and created when it is requested for the first time only
  locator.registerLazySingleton<DioHelper>(() => DioHelper());
  locator.registerLazySingleton<AuthRepo>(() => AuthRepo(locator<DioHelper>()));

  // Register AuthCubit as factory ===> New instance each time
  locator.registerFactory<AuthCubit>(() => AuthCubit());
}
