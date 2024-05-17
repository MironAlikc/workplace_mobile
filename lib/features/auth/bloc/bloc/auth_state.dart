part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthError extends AuthState {}

final class TestState extends AuthState {}

final class AuthSucces extends AuthState {
  final TokenModel result;

  AuthSucces({required this.result});
}
