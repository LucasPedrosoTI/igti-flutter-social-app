import 'package:flutter/material.dart';

class CommentCard extends StatelessWidget {
  final _snapshot;
  final int index;

  CommentCard(this._snapshot, this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('${_snapshot.data[index].name}'),
            subtitle: Text('${_snapshot.data[index].email}'),
          ),
          ListTile(
            title: Text('${_snapshot.data[index].body}'),
          )
        ],
      ),
    );
  }
}
