
class Post {
  final int userId;
  final int id;
  final String? title;
  final String? body;

  Post({required this.userId, required this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toMap(){
      return {
           "id" : id,
           "userId": userId,
           "title" : title,
           "body" : body
      };
  }
}
