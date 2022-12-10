import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../repository/user_repo.dart';

class LogoutUsecase {
  final UserRepo userRepo;

  LogoutUsecase({required this.userRepo});

  Future<Either<Failure, Unit>> call() async {
    return await userRepo.logout();
  }
}
