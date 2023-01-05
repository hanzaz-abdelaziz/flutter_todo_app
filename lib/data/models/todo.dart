class Todo {
  int? id;
  String? title;
  bool done;

  Map<String, Object?> toMap() {
    return <String, Object?>{
      "_id" : id,
      "tile": title,
      "done": done == true ? 1 : 0
    };

  }

  Todo({required this.id, this.title, this.done = false});

  factory Todo.fromJson(Map<String, Object?> map) {
      return Todo(
          id: map["_id"] as int,
          title: map["title"] as String,
          done: map["done"] as bool
      );
  }

}

