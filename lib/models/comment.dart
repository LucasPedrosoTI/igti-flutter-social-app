class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

  Comment.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        email = json['email'],
        postId = json['postId'],
        body = json['body'];
}