import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/data/models/post.dart';
import 'package:flutter_todo_app/data/sql/database_helper.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  void addAndGetData() async{
    final db = await MyDatabaseHelper().getDb();
    final post = Post(userId: 1, id: 1, title: "post 1", body: "body post 1");
    await db!.insert("users", post.toMap());
    final posts = await db.rawQuery("SELECT * FROM posts");
    log("Users : ${posts.length}");
    db.close();
  }

  @override
  void initState() {
    addAndGetData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User : Test Sqlite"),
        centerTitle: true,
      ),
      body: const Center(child: Text("Users : "),),
    );
  }
}
