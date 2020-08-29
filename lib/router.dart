import 'package:flutter/material.dart';

class Router {
  BuildContext _context;
  var _navigator;

  Router();
  Router.fromContext(this._context);

  set context(BuildContext value) {
    _context = value;
  }

  set navigator(value) {
    _navigator = value == Navigator.push ?  Navigator.push : Navigator.pushReplacement;
  }


  to({Widget page, Function function, pushType}) {
    if (function == null) {
      return _navigator(
          _context, MaterialPageRoute(builder: (context) => page));
    }

    return _navigator(
            _context, MaterialPageRoute(builder: (context) => page))
        .then((value) => function.call());
  }
}
