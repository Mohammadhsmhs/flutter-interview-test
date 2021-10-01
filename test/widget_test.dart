// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview_test/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("failing test example", (WidgetTester tester) async {
    final BuildContext context = tester.element(find.byType(Container));
    app.main();
    await tester.pumpAndSettle();

    expect(find.text("Oops! nothing to show :("), findsOneWidget);
    final Finder fab = find.byIcon(Icons.add);

    await tester.tap(fab);
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'hi');

    await tester.tap(find.text("Save"));
    await tester.pumpAndSettle();

    expect(find.text('hi'), findsOneWidget);

    final Finder del = find.byIcon(Icons.delete);
    await tester.tap(del);
    await tester.pumpAndSettle();
    expect(find.text("Oops! nothing to show :("), findsOneWidget);
  });
}
