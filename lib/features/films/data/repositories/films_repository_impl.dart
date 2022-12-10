import 'package:dartz/dartz.dart';
import 'package:mina_pharma_task_movie/core/errors/exceptions.dart';
import 'package:mina_pharma_task_movie/core/errors/failures.dart';
import 'package:mina_pharma_task_movie/features/films/domain/entities/film_entity.dart';

import '../../../../core/connectivity/network_status.dart';
import '../../domain/repositories/films_repository.dart';
import '../datasources/films_local_datasource.dart';
import '../datasources/films_remote_datasource.dart';
import '../models/film_model.dart';

class FilmsRepositoryImpl implements FilmsRepository {
  final FilmsRemoteDataSource remoteDataSource;
  final FilmsLocalDataSource localDataSource;
  final NetworkStatus networkStatus;

  FilmsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkStatus,
  });

  @override
  Future<Either<Failure, List<FilmEntity>>> getFilms() async {
    if (await networkStatus.isConnected) {
      try {
        List<FilmModel> remoteFilms = await remoteDataSource.getFilms();
        localDataSource.cacheFilms(remoteFilms);
        return Right(remoteFilms);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        List<FilmModel> localFilms = await localDataSource.getCachedFilms();
        return Right(localFilms);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      } on NoInternetException {
        return Left(NoInternetFailure());
      }
    }
  }
}
