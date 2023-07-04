import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홈 화면'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('노트 바로가기'),
          onPressed: () {
            Navigator.pushNamed(context, '/note');
          },
        ),
      ),
    );
  }
}
