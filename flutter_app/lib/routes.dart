import 'package:get/get.dart';

import 'package:flutter_app/views/home.dart';
import 'package:flutter_app/views/note.dart';

final routes = [
  GetPage(name: '/', page: () => const HomePage()),
  GetPage(name: '/note', page: () => NotePage())
];
