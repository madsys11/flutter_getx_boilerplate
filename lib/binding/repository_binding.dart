import 'package:get/instance_manager.dart';

import '../data/repository/post_repository.dart';
import '../data/repository/repository_tag.dart';
import '../data/repository/user_repository.dart';

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
