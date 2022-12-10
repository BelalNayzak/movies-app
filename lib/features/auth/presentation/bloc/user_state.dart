part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class LoginScreenState extends UserState {}

class SignupScreenState extends UserState {}

class AuthedState extends UserState {}

class NotAuthedState extends UserState {
  final String errorMessage;
  NotAuthedState({required this.errorMessage});
}

class AuthLoadingState extends UserState {}

class AuthOutState extends UserState {}
