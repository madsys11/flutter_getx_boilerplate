class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  static Post fromMap(Map<String, dynamic> json) {
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }
}
