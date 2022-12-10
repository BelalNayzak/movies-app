import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entity/user.dart';

abstract class UserRepo {
  Future<Either<Failure, Unit>> signup(User user);
  Future<Either<Failure, Unit>> login(User user);
  Future<Either<Failure, Unit>> logout();
}
