import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/post_controller.dart';
import 'post_widget.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postController = Get.find<PostController>();
    final posts = postController.posts;
    return Obx(() => RefreshIndicator(
          onRefresh: () {
            return postController.fetchPosts();
          },
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostWidget(post: posts[index]);
              }),
        ));
  }
}
