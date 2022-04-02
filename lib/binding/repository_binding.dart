import 'package:flutter_getx_boilerplate/data/repositiory/user_repository.dart';
import 'package:get/instance_manager.dart';

import '../data/repositiory/post_repository.dart';
import '../data/repositiory/repository_tag.dart';

class RepositoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(),
      tag: RepositoryTag.user,
      fenix: true,
    );
    Get.lazyPut<PostRepository>(
      () => PostRepositoryImpl(),
      tag: RepositoryTag.post,
      fenix: true,
    );
  }
}
