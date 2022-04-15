import 'package:get_storage/get_storage.dart';

import '../../app/app_keys.dart';

abstract class UserRepository {
  String? signinId();
  String? signinToken();
  bool? rememberMe();
  bool? autoSignin();
  void setRememberMe(bool value);
  void setAutoSignin(bool value);
  void setSigninId(String value);
  Future<bool> signin(String id, String pw);
  Future<void> signout();
}

class UserRepositoryImpl implements UserRepository {
  @override
  String? signinId() {
    GetStorage box = GetStorage();
    return box.read(AppKeys.signinId);
  }

  @override
  String? signinToken() {
    GetStorage box = GetStorage();
    return box.read(AppKeys.signinToken);
  }

  @override
  bool? rememberMe() {
    GetStorage box = GetStorage();
    return box.read(AppKeys.rememberMe);
  }

  @override
  bool? autoSignin() {
    GetStorage box = GetStorage();
    return box.read(AppKeys.autoSignin);
  }

  @override
  void setRememberMe(bool value) {
    GetStorage box = GetStorage();
    box.write(AppKeys.rememberMe, value);
  }

  @override
  void setAutoSignin(bool value) {
    GetStorage box = GetStorage();
    box.write(AppKeys.autoSignin, value);
  }

  @override
  void setSigninId(String value) {
    GetStorage box = GetStorage();
    box.write(AppKeys.signinId, value);
  }

  void _signinSuccess(String id, String token) {
    GetStorage box = GetStorage();
    box.write(AppKeys.signinId, id);
    box.write(AppKeys.signinToken, token);
  }

  void _signout() {
    GetStorage box = GetStorage();
    box.remove(AppKeys.signinToken);
  }

  @override
  Future<bool> signin(String id, String pw) async {
    // fake signin
    return await Future.delayed(Duration(seconds: 1), () {
      _signinSuccess(id, 'testToken');
      return true;
    });

    // todo: signin to server
  }

  @override
  Future<void> signout() async {
    // fake signout
    Future.delayed(Duration(seconds: 1), () {
      _signout();
    });

    // todo: signout from server
  }
}
