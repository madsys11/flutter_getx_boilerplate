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
    try {
      final List<dynamic> posts =
          await RestService.request(RestApi.fetchPosts.url);
      return posts.map((json) => Post.fromMap(json)).toList();
    } catch (e) {
      appLog('exception: $e');
    }
    return [];
  }
}
