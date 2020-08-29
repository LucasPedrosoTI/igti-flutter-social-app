import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:social_app/models/post.dart';
import 'package:social_app/models/user.dart';

class PlaceholderService {
  final baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> getPosts() async {
    var response = await http.get('$baseUrl/posts');
    if (response.statusCode == 200) {
      var objs = jsonDecode(response.body) as List;
      var posts = objs.map((obj) => Post.fromJson(obj)).toList();
      return posts;
    } else {
      throw Exception('Erro ao buscar posts');
    }
  }

  Future<User> getPerfil() async {
    var response = await http.get('$baseUrl/users/1');

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Erro ao buscar perfil do usuário.');
    }
  }
} 