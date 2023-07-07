import 'dart:async';

import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter_app/models/note.dart';
import 'package:flutter_app/forms/note.dart';
import 'package:flutter_app/exceptions.dart';

/// CRUD: create, retrieve, update, delete
class NoteController extends GetxController {
  final notesRef = FirebaseDatabase.instance.ref().child('notes');
  RxList<Note> items = <Note>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchData();
  }

  Future<List<Note>> _fetchData() async {
    final snapshot = await notesRef.get();

    if (snapshot.exists) {
      items.value = (snapshot.value as Map).entries.map((e) => Note(
        id: e.key,
        content: (e.value as Map)[NoteField.content],
        createdOn: (e.value as Map)[NoteField.createdOn]
      )).toList();
    }

    return items;
  }

  Future<Note> retrieve(String key) async {
    final snapshot = await notesRef.child(key).get();
    if (snapshot.exists) {
      return Note(
        id: snapshot.key,
        content: (snapshot.value as Map)[NoteField.content],
        createdOn: (snapshot.value as Map)[NoteField.createdOn]
      );
    }
    throw NotFoundError();
  }

  void create(NoteForm form) async {
    Note note = Note(content: form.content);
    DatabaseReference ref = notesRef.push();
    ref.set({
      NoteField.id: ref.key,
      NoteField.content: note.content,
      NoteField.createdOn: DateTime.now().toString()
    });
    items.add(note);
  }

  void delete(String key) async {
    await notesRef.child(key).remove();
    items.removeWhere((e) => e.id == key);
  }
}
