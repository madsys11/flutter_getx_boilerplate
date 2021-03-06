import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/post_controller.dart';
import '../../../controller/signout_controller.dart';
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
            leading: IconButton(
                onPressed: _showConfirmDialog, icon: Icon(Icons.logout)),
          ),
          body: Body(),
        ),
      );
    });
  }

  void _showConfirmDialog() {
    Get.defaultDialog(
      middleText: 'Do you want to sign out?',
      cancel:
          ElevatedButton(onPressed: () => Get.back(), child: Text('Cancel')),
      confirm: ElevatedButton(onPressed: _signout, child: Text('Ok')),
    );
  }

  void _signout() {
    Get.back();
    final signoutController = Get.find<SignoutController>();
    signoutController.signout();
  }
}
