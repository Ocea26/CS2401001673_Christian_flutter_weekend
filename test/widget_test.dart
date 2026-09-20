// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:medication_reminder/main.dart';

void main() {
  testWidgets('Medication reminder home screen shows title and empty state', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MedicationReminderApp(),
      ),
    );

    expect(find.text('Medication Reminder'), findsOneWidget);
    expect(find.text("Today's schedule"), findsOneWidget);
    expect(find.text('No medications scheduled yet'), findsOneWidget);
  });
}
