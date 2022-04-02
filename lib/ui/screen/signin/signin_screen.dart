import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/signin_controller.dart';
import '../../widget/loading_container.dart';
import 'widget/body.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final SigninController signinController = Get.find();
      return LoadingContainer(
        loading: signinController.loading,
        child: Scaffold(
          body: const Body(),
        ),
      );
    });
  }
}
