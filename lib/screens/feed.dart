import 'package:flutter/material.dart';
import 'package:social_app/components/appBar.dart';
import 'package:social_app/components/drawer.dart';
import 'package:social_app/components/listView.dart';
import 'package:social_app/models/post.dart';
import 'package:social_app/services/placeholder_service.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final PlaceholderService _placeholderService = PlaceholderService();
  List<Post> _posts = [];

  void initState() {
    super.initState();
    _placeholderService.getPosts().then((resp) {
      setState(() {
        _posts = resp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarComponent.build(title: 'Feed'),
        drawer: DrawerComponent(),
        body: Container(
          color: Colors.white24,
          child: FutureBuilder<List<Post>>(
            future: _placeholderService.getPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListViewComponent.listView(snapshot: snapshot);
              } else if (snapshot.hasError) {
                return Text('Erro');
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
