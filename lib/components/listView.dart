import 'package:flutter/material.dart';
import 'package:social_app/components/card.dart';
import 'package:social_app/models/post.dart';

class ListViewComponent {

  static listView({AsyncSnapshot<List<Post>> snapshot}) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return CardComponent.card(snapshot: snapshot, index: index);
        });
  }

}