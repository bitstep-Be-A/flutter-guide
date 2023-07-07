import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('홈 화면'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('노트 바로가기'),
          onPressed: () {
            Get.toNamed('/note');
          },
        ),
      ),
    );
  }
}
