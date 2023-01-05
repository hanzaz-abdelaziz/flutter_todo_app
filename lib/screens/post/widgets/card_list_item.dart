import 'package:flutter/material.dart';

import '../../../data/models/post.dart';
import '../post_details.dart';

class PostCardItem extends StatelessWidget {
  const PostCardItem({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4),
      child: ListTile(
        title: Text(post.title!),
        trailing: IconButton(
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => PostDetailsScreen(post: post))
            );
          },
          icon: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}


