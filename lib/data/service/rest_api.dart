import 'rest_service.dart';

enum RestApi {
  siginIn,
  fetchPosts,
}

extension RestApiEx on RestApi {
  String get url {
    switch (this) {
      case RestApi.siginIn:
        return '${RestService.host}/signin';
      case RestApi.fetchPosts:
        return '${RestService.host}/posts';
    }
  }
}
