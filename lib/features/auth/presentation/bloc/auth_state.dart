part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState();
}

final class AuthBlocInitial extends AuthState {

}

final class AuthLoading extends AuthState {

}

final class AuthSuccess extends AuthState {
  final User user;
  const AuthSuccess(
    this.user
  );
}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(
    this.message
  );
}