import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mina_pharma_task_movie/core/errors/failures.dart';
import 'package:mina_pharma_task_movie/core/strings/strings.dart';
import 'package:mina_pharma_task_movie/features/films/domain/entities/film_entity.dart';

import '../../../domain/usecases/get_films_usecase.dart';

part 'films_event.dart';
part 'films_state.dart';

class FilmsBloc extends Bloc<FilmsEvent, FilmsState> {
  final GetFilmsUseCase getFilmsUseCase;

  FilmsBloc({
    required this.getFilmsUseCase,
  }) : super(FilmsInitial()) {
    on<FilmsEvent>((event, emit) async {
      if (event is GetFilmsEvent || event is RefreshFilmsEvent) {
        emit(LoadingFilmsState());
        final eitherFilmsOrFailure = await getFilmsUseCase.call();
        eitherFilmsOrFailure.fold(
          (l_failure) {
            emit(
              FilmsErrorState(
                errorMessage: _mapFailureToErrorMessage(l_failure),
              ),
            );
          },
          (r_films) {
            emit(FilmsLoadedState(films: r_films));
          },
        );
      }
    });
  }

  String _mapFailureToErrorMessage(Failure f) {
    switch (f.runtimeType) {
      case NoInternetFailure:
        return NO_INTERNET_ERROR;
      case ServerFailure:
        return SERVER_ERROR;
      case EmptyCacheFailure:
        return EMPTY_CACHE_ERROR;
      default:
        return UNEXPECTED_ERROR;
    }
  }
}
