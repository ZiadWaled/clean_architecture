import 'package:clean_architecture/app/app_prefs.dart';
import 'package:clean_architecture/data/data_source/remote_data_source.dart';
import 'package:clean_architecture/data/network/app_api.dart';
import 'package:clean_architecture/data/network/dio_factory.dart';
import 'package:clean_architecture/data/network/network_info.dart';
import 'package:clean_architecture/data/repository/repository_impl.dart';
import 'package:clean_architecture/domain/repository/repository.dart';
import 'package:clean_architecture/domain/usecase/base_usecase.dart';
import 'package:clean_architecture/domain/usecase/login_usecase.dart';
import 'package:clean_architecture/presentation/login/viewmodel/login_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;
Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  // App prefs instance
  instance
      .registerLazySingleton<AppPreference>(() => AppPreference(instance()));

  // Network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();
  // app Service Clint
  instance.registerLazySingleton<AppServiceClint>(() => AppServiceClint(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  // login module, its a module where we put all generic dependencies

  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    // use case model
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    // login view model
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}