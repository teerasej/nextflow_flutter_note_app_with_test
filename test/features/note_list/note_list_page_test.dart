import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextflow_flutter_note_app_with_test/features/note_list/note_list_page.dart';
import 'package:nextflow_flutter_note_app_with_test/providers/note_provider.dart';
import 'package:provider/provider.dart';

void main() {
  group(
    'show notes',
    () {
      testWidgets(
        'show note should show "empty list" if data if not existed',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            MaterialApp(
              home: Scaffold(
                body: NoteListPage(),
              ),
            ),
          );

          expect(find.byType(ListView), findsNothing);
          expect(find.text('empty list'), findsOneWidget);
        },
      );

      testWidgets('show list of notes if data exist',
          (WidgetTester tester) async {
        var provider = NoteProvider();

        await tester.pumpWidget(
          MaterialApp(
            home: ChangeNotifierProvider(
              create: (context) => provider,
              child: Scaffold(
                body: NoteListPage(),
              ),
            ),
          ),
        );

        provider.createNote(message: 'test');
        await tester.pumpAndSettle();

        expect(find.byType(ListView), findsOneWidget);
      });
    },
  );
}
