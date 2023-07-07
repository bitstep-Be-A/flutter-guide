import 'package:flutter_app/exceptions.dart';

class NoteField {
  static const String id = 'id';
  static const String content = 'content';
  static const String createdOn = 'created_on';
}

class Note {
  final String? id;
  final String content;
  final String? createdOn;

  Note({
    this.id,
    required this.content,
    this.createdOn
  }){
    initValidate();
  }

  void initValidate() {
    if (content.isEmpty) {
      throw ValidationError(cause: "Content shouldn't be empty");
    }
  }
}
