import 'package:flutter/material.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Center(
        child: ElevatedButton(
          key: Key('add_note_button'),
          onPressed: () {
            Navigator.pushNamed(context, '/new-note');
          },
          child: Text('Add Note'),
        ),
      ),
    );
  }
}
