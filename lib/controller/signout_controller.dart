import 'package:flutter_getx_boilerplate/app/routes.dart';
import 'package:flutter_getx_boilerplate/controller/base_controller.dart';
import 'package:flutter_getx_boilerplate/data/repositiory/user_repository.dart';
import 'package:get/get.dart';

class SignoutController extends BaseController {
  final UserRepository _userRepository =
      Get.find(tag: (UserRepository).toString());

  Future<void> signout() async {
    loading = true;

    await _userRepository.signout();
    Get.offAndToNamed(RouteName.signin);

    loading = false;
  }
}
