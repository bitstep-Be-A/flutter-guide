import 'package:flutter/material.dart';

import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/note.dart';

final routes = {
  '/': (BuildContext context) => HomePage(),
  '/note': (BuildContext context) => NotePage(),
};
