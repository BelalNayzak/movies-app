import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mina_pharma_task_movie/features/auth/presentation/bloc/user_bloc.dart';
import 'package:mina_pharma_task_movie/features/auth/presentation/pages/signup_page.dart';
import 'package:mina_pharma_task_movie/features/auth/presentation/pages/welcome_page.dart';
import 'package:mina_pharma_task_movie/features/films/presentation/bloc/films/films_bloc.dart';
import 'package:mina_pharma_task_movie/features/films/presentation/pages/films_page.dart';

import 'core/dependency_injection/injection_container.dart';
import 'features/films/presentation/pages/home_page.dart';

// -----------------------------------
// TODO: READ THE README.md FILE PLEASE! ^_^
//
// TODO: I HAVE IMPORTANT NOTES THERE!
// -----------------------------------

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // make sure to add the GetAllPostsEvent at the beginning of the app
        BlocProvider(create: (_) => gtt<FilmsBloc>()..add(GetFilmsEvent())),
        BlocProvider(create: (_) => gtt<UserBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: WelcomePage.id,
        routes: {
          WelcomePage.id: (_) => WelcomePage(),
          SignupPage.id: (_) => SignupPage(),
          HomePage.id: (_) => HomePage(),
          FilmsPage.id: (_) => FilmsPage(),
        },
      ),
    );
  }
}
