import 'package:flutter/material.dart';
import 'package:social_app/components/appBar.dart';
import 'package:social_app/components/listView.dart';
import 'package:social_app/models/comment.dart';
import 'package:social_app/services/placeholder_service.dart';

class Comments extends StatelessWidget {
  final _placeholderService = PlaceholderService();
  final int postId;

  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.build(title: 'Comentários'),
      body: Container(
        color: Colors.white30,
        child: FutureBuilder<List<Comment>>(
          future: _placeholderService.getComments(postId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListViewComponent.listView(snapshot: snapshot, cardType: "comment");
            } else if (snapshot.hasError) {
              return Text('Erro');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
