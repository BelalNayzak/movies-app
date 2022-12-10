import 'dart:convert' as convert;

import 'package:dartz/dartz.dart';
import 'package:mina_pharma_task_movie/core/strings/strings.dart';
import 'package:mina_pharma_task_movie/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';

abstract class UserLocalDatasource {
  Future<Unit> signup(UserModel user);
  Future<Unit> login(UserModel user);
  Future<Unit> logout();
}

class UserLocalDatasourceImpl implements UserLocalDatasource {
  final SharedPreferences prefs;

  UserLocalDatasourceImpl({required this.prefs});

  @override
  Future<Unit> login(UserModel inputUser) async {
    // 1. get list of registered users
    List<UserModel> users = _getListOfLoggedUsers();
    // 2. search and check if the user exists in the list
    UserModel? user = _getTheUserIfExists(inputUser, users);
    // 3. if user exists then check the email and pass
    if (user != null) {
      // 3.1. if the email and pass matching then
      if (_compareIfEquals(user, inputUser)) {
        // 3.1.1. save as current user
        _saveAsCurrentUser(user);
        // 3.1.2. login: navigate to home screen after check return val is true
        return Future.value(unit);
      } else {
        // 3.2. if pass incorrect tell him wrong pass todo
        throw WrongPassException();
      }
    } else {
      print('******** hi');
      // 4. if not exists tell him no profile found for this email todo
      throw BookedEmailException();
    }
  }

  @override
  Future<Unit> signup(UserModel inputUser) {
    // 1. get list of registered users
    List<UserModel> users = _getListOfLoggedUsers();
    // 2. search and check if the user exists in the list
    UserModel? user = _getTheUserIfExists(inputUser, users);
    // 3. if user not exists then (assuming email & pass syntax are validated by the form in ui)
    if (user == null) {
      // 3.1. add user to registered users list
      users.add(inputUser);
      // 3.2. cache the list
      _cacheListAfterUpdate(users);
      // 3.3. save as current user
      _saveAsCurrentUser(inputUser);
      // 3.4. login: navigate to home screen after check return val is true
      return Future.value(unit);
    } else {
      // 4. if exists tell him we found a profile attached for this email todo
      throw BookedEmailException();
    }
  }

  @override
  Future<Unit> logout() {
    prefs.remove(CURRENT_USER);
    return Future.value(unit);
  }

  List<UserModel> _getListOfLoggedUsers() {
    String? loggedUsersJsonString = prefs.getString(LOGGED_USERS);
    if (loggedUsersJsonString != null) {
      List decodedUsersJson = convert.json.decode(loggedUsersJsonString);
      List<UserModel> users =
          decodedUsersJson.map((u) => UserModel.fromjson(u)).toList();
      return users;
    } else {
      prefs.setString(LOGGED_USERS, '[]');
      return [];
    }
  }

  UserModel? _getTheUserIfExists(UserModel inputUser, List<UserModel> users) {
    try {
      return users.firstWhere((u) => u.email == inputUser.email);
    } catch (e) {
      return null;
    }
  }

  bool _compareIfEquals(UserModel user, UserModel inputUser) {
    return inputUser.email == user.email;
  }

  _saveAsCurrentUser(UserModel user) {
    prefs.setString(CURRENT_USER, user.tojson().toString());
  }

  _cacheListAfterUpdate(List<UserModel> users) {
    List<Map<String, dynamic>> listOfMappedModels =
        users.map((u) => u.tojson()).toList();
    String encodedUsers = convert.json.encode(listOfMappedModels);
    prefs.setString(LOGGED_USERS, encodedUsers);
  }
}
