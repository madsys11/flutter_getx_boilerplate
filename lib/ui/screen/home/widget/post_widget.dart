import 'package:flutter/material.dart';

import '../../../../data/model/post.dart';

class PostWidget extends StatelessWidget {
  final Post post;
  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
        ),
        Divider(),
      ],
    );
  }
}
