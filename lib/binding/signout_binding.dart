import 'package:flutter_getx_boilerplate/controller/signout_controller.dart';
import 'package:get/instance_manager.dart';

class SignoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignoutController());
  }
}
