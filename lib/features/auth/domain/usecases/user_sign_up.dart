import 'package:aims/features/auth/domain/repository/auth_repository.dart';
import 'package:aims/core/common/entities/user.dart';
import 'package:aims/core/usecases/usecase.dart';
import 'package:aims/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements UseCase<User, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String name;
  final String email;
  final String password;

  UserSignUpParams({required this.name, required this.email, required this.password});
}