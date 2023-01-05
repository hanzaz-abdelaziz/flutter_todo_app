import 'package:flutter/material.dart';
import 'package:flutter_todo_app/screens/post/widgets/card_list_item.dart';

import '../../../data/models/post.dart';

class ListPosts extends StatelessWidget {

  const ListPosts({Key? key, this.posts}) : super(key: key);

  final List<Post>? posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts!.length,
        itemBuilder: (context, index){
          return PostCardItem(post: posts![index],);
        }

    );
  }
}
