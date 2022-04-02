import 'package:flutter/material.dart';
import 'package:flutter_getx_boilerplate/controller/signout_controller.dart';
import 'package:get/get.dart';

import '../../../controller/post_controller.dart';
import '../../widget/loading_container.dart';
import 'widget/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final postController = Get.find<PostController>();
      return LoadingContainer(
        loading: postController.loading,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HOME'),
            leading: IconButton(onPressed: _signout, icon: Icon(Icons.logout)),
          ),
          body: Body(),
        ),
      );
    });
  }

  void _signout() {
    final signoutController = Get.find<SignoutController>();
    signoutController.signout();
  }
}
