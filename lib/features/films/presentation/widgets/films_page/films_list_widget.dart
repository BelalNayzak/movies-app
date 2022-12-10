import 'package:flutter/material.dart';
import 'package:mina_pharma_task_movie/features/films/presentation/widgets/shared/film_widget.dart';

import '../../../domain/entities/film_entity.dart';

class FilmsListWidget extends StatelessWidget {
  final List<FilmEntity> films;
  const FilmsListWidget({required this.films, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: films.length,
      itemBuilder: (_, i) => FilmWidget(
        name: films[i].title,
        img: films[i].image,
      ),
    );
  }
}

// class x extends StatelessWidget {
//   const x({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (_, __) => Divider(thickness: 1),
//       itemCount: films.length,
//       itemBuilder: (_, i) => ListTile(
//         leading: Text(films[i].id!),
//         title: Text(films[i].title),
//         subtitle: Text(films[i].image),
//         onTap: () {},
//       ),
//     );
//   }
// }
