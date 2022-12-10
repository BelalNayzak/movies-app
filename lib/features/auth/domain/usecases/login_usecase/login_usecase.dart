import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../entity/user.dart';
import '../../repository/user_repo.dart';

class LoginUsecase {
  final UserRepo userRepo;

  LoginUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> call(User user) async {
    return await userRepo.login(user);
  }
}
