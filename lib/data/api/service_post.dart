

import 'package:dio/dio.dart';

import '../models/post.dart';

class PostService{

  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  static Future<List<Post>> getPosts() async{
    Dio dio = Dio();
    Response response = await dio.get('$baseUrl/posts');
    if (response.statusCode == 200) {
      List<dynamic> arrJson = response.data;
       return arrJson.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load post');
    }
  }


}