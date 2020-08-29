import 'package:flutter/material.dart';
import 'package:social_app/components/post_card.dart';

import 'commentCard.dart';

class ListViewComponent {

  static listView({AsyncSnapshot<List<dynamic>> snapshot, String cardType}) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          switch(cardType){
            case 'post':
              return PostCard.card(snapshot: snapshot, index: index, context: context);
              break;
            case 'comment':
              return CommentCard(snapshot, index);
              break;
            default:
              return Card(child: Text('Empty Card'));
          }
        });
  }

}