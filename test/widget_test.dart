// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_interview_test/presentation/screens/ToDo/todo.dart';
import 'package:flutter_interview_test/presentation/widgets/todo/todo_item.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_interview_test/main.dart';

void main() {
  testWidgets('remove todo from list test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpWidget(Todo());

    await tester.pumpWidget(TodoItem(title: 'testing', index: 0));

    const title = 'testing';
    expect(title, findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete));

    expect(title, findsNothing);
  });
}
