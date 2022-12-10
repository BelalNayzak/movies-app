import 'package:dartz/dartz.dart';
import 'package:mina_pharma_task_movie/features/auth/domain/entity/user.dart';
import 'package:mina_pharma_task_movie/features/auth/domain/repository/user_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../datasources/user_local_datasource.dart';
import '../model/user_model.dart';

class UserRepoImpl implements UserRepo {
  final UserLocalDatasource userLocalDatasource;

  UserRepoImpl({required this.userLocalDatasource});

  @override
  Future<Either<Failure, Unit>> login(User user) async {
    try {
      UserModel u = UserModel(
          name: user.name, email: user.email, password: user.password);
      await userLocalDatasource.login(u);
      return const Right(unit);
    } on WrongPassException {
      return Left(WrongPassFailure());
    } on BookedEmailException {
      return Left(NotRegisteredFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> signup(User user) async {
    try {
      UserModel u = UserModel(
          name: user.name, email: user.email, password: user.password);
      await userLocalDatasource.signup(u);
      return const Right(unit);
    } on BookedEmailException {
      return Left(AlreadyRegisteredFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    await userLocalDatasource.logout();
    return const Right(unit);
  }
}
