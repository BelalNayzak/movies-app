part of 'films_bloc.dart';

abstract class FilmsState {}

class FilmsInitial extends FilmsState {}

class LoadingFilmsState extends FilmsState {}

class FilmsLoadedState extends FilmsState {
  final List<FilmEntity> films;
  FilmsLoadedState({required this.films});
}

class FilmsErrorState extends FilmsState {
  final String errorMessage;
  FilmsErrorState({required this.errorMessage});
}
