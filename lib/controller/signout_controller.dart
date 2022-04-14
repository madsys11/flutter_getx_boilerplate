import 'package:get/get.dart';

import '../app/routes.dart';
import '../data/repository/repository_tag.dart';
import '../data/repository/user_repository.dart';
import 'base_controller.dart';

class SignoutController extends BaseController {
  final UserRepository _userRepository = Get.find(tag: RepositoryTag.user);

  Future<void> signout() async {
    loading = true;

    await _userRepository.signout();
    Get.offAndToNamed(RouteName.signin);

    loading = false;
  }
}
