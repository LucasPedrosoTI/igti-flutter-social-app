import 'package:flutter/material.dart';

class Router {
  BuildContext _context;

  Router();

  set context(BuildContext value) {
    _context = value;
  }

  to({Widget page, Function function}) {
    if (function == null) {
      return Navigator.pushReplacement(
          _context, MaterialPageRoute(builder: (context) => page));
    }

    return Navigator.pushReplacement(
            _context, MaterialPageRoute(builder: (context) => page))
        .then((value) => function.call());
  }
}
