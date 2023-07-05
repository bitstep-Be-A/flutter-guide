import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/note.dart';

final routes = [
  GetPage(name: '/', page: () => HomePage()),
  GetPage(name: '/note', page: () => NotePage())
];
