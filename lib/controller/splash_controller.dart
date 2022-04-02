import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../app/app_keys.dart';
import '../app/routes.dart';
import '../app/util/app_log.dart';
import 'base_controller.dart';

class SplashController extends BaseController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(const Duration(milliseconds: 500));

    // verify token
    final box = GetStorage();
    final bool autoSignin = box.read(AppKeys.autoSignin) ?? true;
    final String token = box.read(AppKeys.signinToken) ?? '';
    appLog('autoSignin: $autoSignin, token: $token');
    if (autoSignin && token.isNotEmpty) {
      Get.offAllNamed(RouteName.home);
    } else {
      Get.offAllNamed(RouteName.signin);
    }
  }
}
