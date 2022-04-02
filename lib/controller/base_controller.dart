import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(value) => _loading.value = value;
}
