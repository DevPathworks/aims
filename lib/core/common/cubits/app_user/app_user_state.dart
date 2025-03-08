part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState {}

final class AppUserInitial extends AppUserState {}

final class AppUserLoggedIn extends AppUserState {
  final User user;
  AppUserLoggedIn(this.user);
}

// cire cannot depend on other feautes
// other features can depend on core