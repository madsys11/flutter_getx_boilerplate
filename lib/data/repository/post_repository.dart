import '../../app/util/app_log.dart';
import '../model/post.dart';
import '../service/rest_api.dart';
import '../service/rest_service.dart';

abstract class PostRepository {
  Future<List<Post>> fetchPosts();
}

class PostRepositoryImpl implements PostRepository {
  @override
  Future<List<Post>> fetchPosts() async {
    final List<Post> posts = [];
    try {
      dynamic json = await RestService.request(RestApi.fetchPosts.url);
      for (var postData in json) {
        posts.add(Post.fromMap(postData));
      }
    } catch (e) {
      appLog('exception: $e');
    }
    return posts;
  }
}
