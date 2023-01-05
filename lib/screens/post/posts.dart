import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/api/service_post.dart';
import 'package:flutter_todo_app/screens/post/widgets/list_posts.dart';

import '../../data/models/post.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Posts"),
      ),
      body: FutureBuilder<List<Post>>(
        future: PostService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(child: Text("Error refresh again!!"));
            } else {
              //return YourWidget(snapshot.data);
              return ListPosts(posts: snapshot.data);
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
