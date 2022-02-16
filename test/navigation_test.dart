import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Open new note page',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: NoteListPage(),
        ),
      );

      expect(find.byType(NoteListPage), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      expect(find.byType(NewNotePage), findsOneWidget);
    },
  );
}
