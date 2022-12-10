import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:mina_pharma_task_movie/core/strings/strings.dart';
import 'package:mina_pharma_task_movie/features/films/data/models/film_model.dart';

import '../../../../core/errors/exceptions.dart';

abstract class FilmsRemoteDataSource {
  Future<List<FilmModel>> getFilms();
}

class FilmsRemoteDataSourceImpl implements FilmsRemoteDataSource {
  final http.Client client;

  FilmsRemoteDataSourceImpl({required this.client});

  @override
  Future<List<FilmModel>> getFilms() async {
    final url = Uri.parse('$BASE_URL');
    final response = await client.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final decodedJson = convert.json.decode(response.body);
      final decodedFilms = decodedJson['items'];
      List mappedFilms =
          decodedFilms.map((f) => FilmModel.fromjson(f)).toList();
      List<FilmModel> films = mappedFilms.map((e) => e as FilmModel).toList();

      return Future.value(films);
    } else {
      throw ServerException();
    }
  }
}
