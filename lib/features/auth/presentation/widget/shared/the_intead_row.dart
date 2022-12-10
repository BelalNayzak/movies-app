import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_bloc.dart';

class TheInsteadRow extends StatelessWidget {
  final UserState userState;
  const TheInsteadRow({required this.userState, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          userState is SignupScreenState
              ? 'Already have an account?'
              : 'Don\'t have an account?',
          style: const TextStyle(fontSize: 13),
        ),
        GestureDetector(
          onTap: () {
            if (userState is SignupScreenState) {
              BlocProvider.of<UserBloc>(context).emit(LoginScreenState());
            } else {
              BlocProvider.of<UserBloc>(context).emit(SignupScreenState());
            }
          },
          child: Text(
            userState is SignupScreenState ? ' Log in ' : ' Sign up ',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
