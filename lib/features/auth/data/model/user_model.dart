import 'package:mina_pharma_task_movie/features/auth/domain/entity/user.dart';

class UserModel extends User {
  UserModel({
    required super.name,
    required super.email,
    required super.password,
  });

  factory UserModel.fromjson(Map<String, dynamic> jsonMap) {
    return UserModel(
      name: jsonMap['name'],
      email: jsonMap['email'],
      password: jsonMap['password'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
