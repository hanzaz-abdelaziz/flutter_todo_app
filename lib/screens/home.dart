import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/api/service_post.dart';
import 'package:flutter_todo_app/screens/post/widgets/card_list_item.dart';

import '../data/models/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post>? _posts;

  void fetchPost() async {
    _posts = await PostService.getPosts();
    log("Posts are : ${_posts!.length}");
  }
  @override
  void initState() {
    fetchPost();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                setState(() {
                  fetchPost();
                });
              },
              icon: const Icon(Icons.refresh))
        ],
        title: Text(widget.title!),
      ),
      body: _posts != null ? ListView.builder(
          itemCount: _posts!.length,
          itemBuilder: (context, index){
            return PostCardItem(post: _posts![index]);
          },

      ) : const Center(child: CircularProgressIndicator(),),
    );
  }
}
