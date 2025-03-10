import 'package:aims/features/auth/domain/repository/auth_repository.dart';
import 'package:aims/core/common/entities/user.dart';
import 'package:aims/core/usecases/usecase.dart';
import 'package:aims/core/error/failure.dart';
import 'package:fpdart/src/either.dart';

class UserLogin implements UseCase<User, UserLoginParams> {
  final AuthRepository authRepository;
  const UserLogin(this.authRepository);
  
@override
  Future<Either<Failure, User>> call(UserLoginParams params) async {
    return await authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });
}