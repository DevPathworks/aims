import 'package:aims/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:aims/core/usecases/usecase.dart';
import 'package:aims/features/auth/domain/usecases/current_user.dart';
import 'package:aims/features/auth/domain/usecases/user_login.dart';
import 'package:aims/features/auth/domain/usecases/user_sign_up.dart';
import 'package:aims/core/common/entities/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;

  AuthBloc({required UserSignUp userSignUp, required UserLogin userLogin, required CurrentUser currentUser, required AppUserCubit appUserCubit}) : _userSignUp = userSignUp, _userLogin = userLogin, _currentUser = currentUser, _appUserCubit = appUserCubit , super(AuthBlocInitial()) {
    on<AuthEvent>((_,emit) => emit(AuthLoading()));
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_onAuthIsUserLoggedIn);
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {

    final result = await _userSignUp.call(UserSignUpParams(name: event.name, email: event.email, password: event.password));
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {

    final result = await _userLogin.call(UserLoginParams(email: event.email, password: event.password));
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onAuthIsUserLoggedIn(AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {

    final result = await _currentUser.call(NoParams());
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit,) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
