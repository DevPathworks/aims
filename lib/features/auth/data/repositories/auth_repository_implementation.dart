import 'package:aims/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:aims/features/auth/domain/repository/auth_repository.dart';
import 'package:aims/core/common/entities/user.dart';
import 'package:aims/core/error/exceptions.dart';
import 'package:aims/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImplementation implements AuthRepository {

  final AuthRemoteDataSource authRemotedDataSource;
  // final ConnectionChecker connectionChecker;

  AuthRepositoryImplementation(this.authRemotedDataSource);

  @override
  Future<Either<Failure, User>> currentUser() async {
    try {
      // if(!await (connectionChecker.isConnected)) {
      //   // return left(Failure(Constants.noConnectionErrorMesssage));
      //   final session = authRemotedDataSource.currentUserSession;
      //   if(session == null) {
      //     return left(Failure(Constants.noConnectionErrorMesssage));
      //   }

      //   return right(
      //     UserModel(id: session.user.id, email: session.user.email ?? '', name: ''));

      // }

      final user = await authRemotedDataSource.getCurrentUser();

      if(user == null) {
        return left(Failure('No user logged in'));
      }

      return right(user);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> loginWithEmailPassword({required String email, required String password}) async {
    return _getUser(() async => await authRemotedDataSource.loginWithEmailPassword(email, password));
  }

  @override
  Future<Either<Failure, User>> signUpWithEmailPassword({required String name, required String email, required String password}) async {
    return _getUser(() async => await authRemotedDataSource.signUpWithEmailPassword(name, email, password));
  }

  Future<Either<Failure, User>> _getUser(Future<User> Function() fn) async {
    try {
      // if (!await connectionChecker.isConnected) {
      //   return left(Failure(Constants.noConnectionErrorMesssage));
      // }
      final user = await fn();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}