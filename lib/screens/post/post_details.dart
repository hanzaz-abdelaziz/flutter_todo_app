import 'package:flutter/material.dart';
import '../../data/models/post.dart';

class PostDetailsScreen extends StatelessWidget {
  const PostDetailsScreen({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: ()=> Navigator.pop(context),
        ),
        title: const Text("Post Details"),
      ),
      body: Card(
        margin: const EdgeInsets.all(8),
        child: ListTile(
          minVerticalPadding: 16,
          contentPadding: const EdgeInsets.all(16),
          tileColor: Colors.amberAccent.withOpacity(.4),
          title: Text(post.title!, style: Theme.of(context).textTheme.titleLarge),
          subtitle: Text(post.body!, style: Theme.of(context).textTheme.subtitle1),
          trailing: Text("# ${post.id}", style: Theme.of(context).textTheme.headline5),
        ),
      ),
    );
  }
}
