import 'package:get/instance_manager.dart';

import '../controller/signout_controller.dart';

class SignoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignoutController());
  }
}
