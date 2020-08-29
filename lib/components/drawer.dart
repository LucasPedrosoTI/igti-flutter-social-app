import 'package:flutter/material.dart';
import 'package:social_app/router.dart';
import 'package:social_app/screens/feed.dart';
import 'package:social_app/screens/perfil.dart';
import 'package:social_app/services/placeholder_service.dart';

class DrawerComponent extends StatelessWidget {
  final styles = {'text': TextStyle(fontSize: 20)};
  final _placeholderService = PlaceholderService();

  @override
  Widget build(BuildContext context) {

    Router router = Router.fromContext(context);
    router.navigator = Navigator.pushReplacement;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Image.asset('assets/logo.png', width: 20),
          ),
          ListTile(
            title: Text(
              'Perfil',
              style: styles['text'],
            ),
            onTap: () {
              Navigator.pop(context);
              _placeholderService.getPerfil().then((user){
                return router.to(page: Perfil(user));
              });
            },
          ),
          ListTile(
              title: Text('Feed', style: styles['text']),
              onTap: () {
                Navigator.pop(context);
                return router.to(page: Feed());
              }),
        ],
      ),
    );
  }
}
