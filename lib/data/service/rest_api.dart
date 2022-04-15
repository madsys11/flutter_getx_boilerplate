import 'rest_service.dart';

enum RestApi {
  signIn,
  fetchPosts,
}

extension RestApiEx on RestApi {
  String get url {
    switch (this) {
      case RestApi.signIn:
        return '${RestService.host}/signin';
      case RestApi.fetchPosts:
        return '${RestService.host}/posts';
    }
  }
}
