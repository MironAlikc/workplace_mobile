import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:workplace_mobile/features/auth/models/token_model.dart';
import 'package:workplace_mobile/features/auth/repositories/get_token_repo.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<GetTokenEvent>((event, emit) async {
      try {
        final result = await repo.getToken(
          login: event.login,
          password: event.password,
        );
        final TokenModel data = TokenModel.fromJson(result);
        emit(
          AuthSucces(result: data),
        );
        final testResult =await repo.getList();
      } catch (e) {
        emit(
          AuthError(),
        );
      }
    });
  }
  final GetTokenRepo repo;
}
