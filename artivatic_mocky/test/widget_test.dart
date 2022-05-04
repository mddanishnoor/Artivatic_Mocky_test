// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:artivatic_mocky/screens/list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:artivatic_mocky/main.dart';

void main() {
  testWidgets('List screen search icon test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Artivatic());

    // Verify that our isSearchActive is false.
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.cancel), findsNothing);

    // Tap the search icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.search));
    await tester.pump();

    // Verify that our isSearchActive is true.
    expect(find.byIcon(Icons.search), findsNothing);
    expect(find.byIcon(Icons.cancel), findsOneWidget);
  });
}
