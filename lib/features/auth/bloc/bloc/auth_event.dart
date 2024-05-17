part of 'auth_bloc.dart';

sealed class AuthEvent {}

class GetTokenEvent extends AuthEvent {
  String login;
  String password;

  GetTokenEvent({
    required this.login,
    required this.password,
  });
}
