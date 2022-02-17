import 'package:flutter/material.dart';

class NoteProvider extends ChangeNotifier {
  List<String> _notes = [];

  void createNote({String message = ''}) {
    _notes.add(message);
    notifyListeners();
  }

  NoteProvider();
}
