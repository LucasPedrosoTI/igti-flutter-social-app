import 'package:flutter/material.dart';

class AppBarComponent  {

  static build({String title}) {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: Text(title),
      centerTitle: true,
    );
  }
}
