import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mina_pharma_task_movie/core/widgets/loading_widget.dart';
import 'package:mina_pharma_task_movie/features/films/presentation/bloc/films/films_bloc.dart';

import '../widgets/films_page/films_list_widget.dart';
import '../widgets/films_page/my_error_widget.dart';

class FilmsPage extends StatelessWidget {
  static const id = 'FilmsPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<FilmsBloc, FilmsState>(
      builder: (context, state) {
        if (state is LoadingFilmsState) {
          return LoadingWidget();
        } else if (state is FilmsLoadedState) {
          return FilmsListWidget(films: state.films);
        } else if (state is FilmsErrorState) {
          return MyErrorWidget(errorMsg: state.errorMessage);
        }
        return LoadingWidget(); // just a widget as default
      },
    );
  }
}
