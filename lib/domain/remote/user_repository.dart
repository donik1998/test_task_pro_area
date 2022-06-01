import 'package:dartz/dartz.dart';
import 'package:new_test_stuff/data/api.dart';
import 'package:new_test_stuff/data/failure.dart';
import 'package:new_test_stuff/domain/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> getUserData();
}

class UserService implements UserRepository {
  UserService._();

  static UserService get instance => UserService._();

  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    return await Task<UserModel>(() => ApiClient.instance.getUserProfile())
        .attempt()
        .map(
          (either) => either.leftMap((err) => err as Failure),
        )
        .run();
  }
}
