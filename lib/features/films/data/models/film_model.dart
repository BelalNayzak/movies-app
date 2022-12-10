import 'package:mina_pharma_task_movie/features/films/domain/entities/film_entity.dart';

class FilmModel extends FilmEntity {
  const FilmModel({
    super.id,
    required super.title,
    required super.image,
  });

  factory FilmModel.fromjson(Map<String, dynamic> jsonMap) {
    return FilmModel(
      id: jsonMap['id'],
      title: jsonMap['title'],
      image: jsonMap['image'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }

  Map<String, dynamic> tojsonButWithoutId() {
    return {
      'title': title,
      'image': image,
    };
  }
}
