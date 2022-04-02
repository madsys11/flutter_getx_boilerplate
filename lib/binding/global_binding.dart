import 'package:get/get.dart';

import '../controller/app_controller.dart';
import '../controller/lifecycle_controller.dart';
import 'repository_binding.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(LifecycleController());

    RepositoryBinding().dependencies();
  }
}
