import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mina_pharma_task_movie/features/auth/data/datasources/user_local_datasource.dart';
import 'package:mina_pharma_task_movie/features/auth/data/repository/user_repo_impl.dart';
import 'package:mina_pharma_task_movie/features/auth/domain/repository/user_repo.dart';
import 'package:mina_pharma_task_movie/features/auth/domain/usecases/login_usecase/login_usecase.dart';
import 'package:mina_pharma_task_movie/features/auth/domain/usecases/logout_usecase/logout_usecase.dart';
import 'package:mina_pharma_task_movie/features/auth/domain/usecases/signup_usecase/signup_usecase.dart';
import 'package:mina_pharma_task_movie/features/auth/presentation/bloc/user_bloc.dart';
import 'package:mina_pharma_task_movie/features/films/data/datasources/films_local_datasource.dart';
import 'package:mina_pharma_task_movie/features/films/data/datasources/films_remote_datasource.dart';
import 'package:mina_pharma_task_movie/features/films/data/repositories/films_repository_impl.dart';
import 'package:mina_pharma_task_movie/features/films/domain/usecases/get_films_usecase.dart';
import 'package:mina_pharma_task_movie/features/films/presentation/bloc/films/films_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/films/domain/repositories/films_repository.dart';
import '../connectivity/network_status.dart';

final gtt = GetIt.instance; // getIt = GetIt.I

Future<void> setupInjection() async {
  /// [ FEATURES - FILMS ]
  /// --------------------

  // Bloc
  gtt.registerFactory<FilmsBloc>(
    () => FilmsBloc(getFilmsUseCase: gtt()),
  );

  // Repository
  gtt.registerLazySingleton<FilmsRepository>(
    () => FilmsRepositoryImpl(
        remoteDataSource: gtt(), localDataSource: gtt(), networkStatus: gtt()),
  );

  // UseCases
  gtt.registerLazySingleton<GetFilmsUseCase>(
    () => GetFilmsUseCase(filmsRepo: gtt()),
  );

  // Datasources
  gtt.registerLazySingleton<FilmsLocalDataSource>(
    () => FilmsLocalDataSourceImpl(sharedPrefs: gtt()),
  );

  gtt.registerLazySingleton<FilmsRemoteDataSource>(
    () => FilmsRemoteDataSourceImpl(client: gtt()),
  );

  /// [ FEATURES - AUTH ]
  /// --------------------

  // bloc
  gtt.registerFactory<UserBloc>(() => UserBloc(
        loginUsecase: gtt(),
        logoutUsecase: gtt(),
        signupUsecase: gtt(),
      ));

  // repos
  gtt.registerLazySingleton<UserRepo>(
      () => UserRepoImpl(userLocalDatasource: gtt()));

  // datasources
  gtt.registerLazySingleton<UserLocalDatasource>(
      () => UserLocalDatasourceImpl(prefs: gtt()));

  // usecases
  gtt.registerLazySingleton<LoginUsecase>(() => LoginUsecase(userRepo: gtt()));
  gtt.registerLazySingleton<LogoutUsecase>(
      () => LogoutUsecase(userRepo: gtt()));
  gtt.registerLazySingleton<SignupUsecase>(
      () => SignupUsecase(userRepo: gtt()));

  /// [ CORE ]
  /// --------------------

  gtt.registerLazySingleton<http.Client>(() => http.Client());

  gtt.registerLazySingleton<NetworkStatus>(
    () => NetworkStatusImpl(internetChecker: gtt()),
  );

  gtt.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
  gtt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
}
