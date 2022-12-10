import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/film_entity.dart';

abstract class FilmsRepository {
  Future<Either<Failure, List<FilmEntity>>> getFilms();
}
