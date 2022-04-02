import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/app_string.dart';
import '../app/routes.dart';
import '../data/repository/repository_tag.dart';
import '../data/repository/user_repository.dart';
import 'base_controller.dart';

class SigninController extends BaseController {
  final UserRepository _userRepository = Get.find(tag: RepositoryTag.user);

  final _idController = TextEditingController();
  final _pwController = TextEditingController();

  final _rememberMe = true.obs;
  final _autoSignin = true.obs;

  TextEditingController get idController => _idController;
  TextEditingController get pwController => _pwController;

  bool get rememberMe => _rememberMe.value;
  bool get autoSignin => _autoSignin.value;

  @override
  void onInit() {
    _rememberMe(_userRepository.rememberMe() ?? true);
    _autoSignin(_userRepository.autoSignin() ?? true);
    if (rememberMe) {
      _idController.text = _userRepository.signinId() ?? '';
    }
    super.onInit();
  }

  @override
  void onClose() {
    _idController.dispose();
    _pwController.dispose();

    super.onClose();
  }

  void changeRememberMe() {
    _userRepository.setRememberMe(!rememberMe);
    _rememberMe(!rememberMe);
  }

  void changeAutoSignin() {
    _userRepository.setAutoSignin(!autoSignin);
    _autoSignin(!autoSignin);
  }

  void _signinSuccess() {
    Get.offAllNamed(RouteName.home);
  }

  Future<bool> signin() async {
    loading = true;

    if (rememberMe) {
      _userRepository.setSigninId(idController.text);
    }

    final success =
        await _userRepository.signin(idController.text, pwController.text);
    if (success) {
      _signinSuccess();
    } else {
      Get.snackbar(AppString.alert, AppString.signinFailed);
    }

    loading = false;

    return success;
  }
}
