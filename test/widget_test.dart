// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:recrutterapp/main.dart';
import 'package:recrutterapp/screens/start_widget.dart';

void main() {
  testWidgets('Main widget test', (WidgetTester tester) async {
    // Собираем виджет Main
    await tester.pumpWidget(
      MaterialApp(
        home: Main(),
      ),
    );

    // Проверяем наличие AppBar с заданными свойствами
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('RECRUITER APP'), findsOneWidget);
    final appBar = tester.widget<AppBar>(find.byType(AppBar));
    expect(appBar.backgroundColor, const Color.fromRGBO(255, 205, 176, 100));

    // Проверяем наличие StartWidget
    expect(find.byType(StartWidget), findsOneWidget);
  });
}
