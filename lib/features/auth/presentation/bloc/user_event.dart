part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class SignupEvent extends UserEvent {
  final User user;

  SignupEvent({required this.user});
}

class LoginEvent extends UserEvent {
  final User user;

  LoginEvent({required this.user});
}

class LogoutEvent extends UserEvent {}

class ChangeScreenToLoginEvent extends UserEvent {}

class ChangeScreenToSignupEvent extends UserEvent {}
