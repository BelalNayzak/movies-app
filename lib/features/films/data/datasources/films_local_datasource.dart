import 'dart:convert' as convert;

import 'package:dartz/dartz.dart';
import 'package:mina_pharma_task_movie/core/errors/exceptions.dart';
import 'package:mina_pharma_task_movie/features/films/data/models/film_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/strings/strings.dart';

abstract class FilmsLocalDataSource {
  Future<List<FilmModel>> getCachedFilms();
  Future<Unit> cacheFilms(List<FilmModel> filmModels);
}

class FilmsLocalDataSourceImpl implements FilmsLocalDataSource {
  final SharedPreferences sharedPrefs;

  FilmsLocalDataSourceImpl({required this.sharedPrefs});

  @override
  Future<Unit> cacheFilms(List<FilmModel> filmModels) {
    List<Map<String, dynamic>> listOfMappedModels =
        filmModels.map((f) => f.tojson()).toList();
    String encodedFilms = convert.json.encode(listOfMappedModels);
    sharedPrefs.setString(CACHED_FILMS, encodedFilms);
    return Future.value(unit);
  }

  @override
  Future<List<FilmModel>> getCachedFilms() {
    final jsonString = sharedPrefs.getString(CACHED_FILMS);
    if (jsonString != null) {
      List decodedJson = convert.json.decode(jsonString);
      List<FilmModel> films =
          decodedJson.map((f) => FilmModel.fromjson(f)).toList();
      return Future.value(films);
    } else {
      throw EmptyCacheException();
    }
  }
}
