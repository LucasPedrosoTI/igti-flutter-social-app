import 'package:flutter/material.dart';
import 'package:social_app/models/post.dart';

class CardComponent {

  static card({AsyncSnapshot<List<Post>> snapshot, int index}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text('${snapshot.data[index].title}'),
            ),
            Text('${snapshot.data[index].body}')
          ],
        ),
      ),
    );
  }

}