import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/film_entity.dart';
import '../repositories/films_repository.dart';

class GetFilmsUseCase {
  final FilmsRepository filmsRepo;

  const GetFilmsUseCase({required this.filmsRepo});

  Future<Either<Failure, List<FilmEntity>>> call() async {
    return await filmsRepo.getFilms();
  }
}
