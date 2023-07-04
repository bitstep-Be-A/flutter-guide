import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('노트'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('홈 화면으로'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
