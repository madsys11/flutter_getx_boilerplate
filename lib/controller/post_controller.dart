import 'package:get/get.dart';

import '../data/model/post.dart';
import '../data/repository/post_repository.dart';
import '../data/repository/repository_tag.dart';
import 'base_controller.dart';

class PostController extends BaseController {
  final PostRepository _postRepository = Get.find(tag: RepositoryTag.post);
  final _posts = <Post>[].obs;
  List<Post> get posts => _posts;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    loading = true;

    _posts.value = await _postRepository.fetchPosts();

    loading = false;
  }
}
