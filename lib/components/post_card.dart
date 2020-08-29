import 'package:flutter/material.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/router.dart';
import 'package:social_app/screens/comments.dart';

class PostCard {
  static card(
      {AsyncSnapshot<List<Post>> snapshot, int index, BuildContext context}) {
    Router router = Router.fromContext(context);
    router.navigator = Navigator.push;
    return GestureDetector(
      onTap: () {
        router.to(page: Comments(snapshot.data[index].id));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                title: Text('${snapshot.data[index].title}'),
                subtitle: Text('${snapshot.data[index].body}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
