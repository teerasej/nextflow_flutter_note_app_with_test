import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_note_app_with_test/features/new_note/new_note_page.dart';
import 'package:nextflow_flutter_note_app_with_test/features/note_list/note_list_page.dart';

void main() {
  testWidgets(
    'Open new note page',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          routes: {
            '/': (context) => NoteListPage(),
            '/new-note': (context) => NewNotePage(),
          },
        ),
      );

      expect(find.byType(NoteListPage), findsOneWidget);

      await tester.tap(
        find.byKey(
          Key('add_note_button'),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(NewNotePage), findsOneWidget);
    },
  );
}
