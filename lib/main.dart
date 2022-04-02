import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_boilerplate/app/app_string.dart';
import 'package:flutter_getx_boilerplate/app/theme/app_theme.dart';
import 'package:flutter_getx_boilerplate/app/util/fake_https.dart';
import 'package:flutter_getx_boilerplate/binding/global_binding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kDebugMode) {
    HttpOverrides.global = FakeHttps();
  }

  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(App()));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: appThemeData,
      getPages: appPages,
      initialBinding: GlobalBinding(),
      initialRoute: RouteName.splash,
    );
  }
}