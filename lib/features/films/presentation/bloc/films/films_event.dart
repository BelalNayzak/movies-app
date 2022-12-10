part of 'films_bloc.dart';

abstract class FilmsEvent {}

class GetFilmsEvent extends FilmsEvent {}

class RefreshFilmsEvent extends FilmsEvent {}
