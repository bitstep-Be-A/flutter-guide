import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_app/controllers/note.dart';
import 'package:flutter_app/forms/note.dart';

class NotePage extends StatelessWidget {
  NotePage({super.key});
  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(NoteController());

    return GetX<NoteController>(
      builder: (noteController) => Scaffold(
        appBar: AppBar(
          title: const Text('노트'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    style: const TextStyle(
                      fontSize: 24.0, height: 2.0, color: Colors.black
                    ),
                    decoration: const InputDecoration(
                      hintText: '내용을 입력하세요'
                    ),
                    controller: inputController,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: noteController.items.length,
                    padding: const EdgeInsets.all(10.0),
                    itemBuilder: (context, position) {
                      return Card(
                        child: ListTile(
                          leading: const Icon(Icons.note),
                          title: Text(noteController.items[position].content),
                          onLongPress: () {
                            noteController.delete(noteController.items[position].id!);
                          },
                        )
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            noteController.create(NoteForm(content: inputController.text));
            inputController.clear();
          },
          tooltip: 'Add Note',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
