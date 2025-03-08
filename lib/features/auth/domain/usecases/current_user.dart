import 'package:aims/features/auth/domain/repository/auth_repository.dart';
import 'package:aims/core/common/entities/user.dart';
import 'package:aims/core/usecases/usecase.dart';
import 'package:aims/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}