// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:e_comm_app/counter_with_getx.dart';
import 'package:e_comm_app/features/_common/app_state.dart';
import 'package:e_comm_app/features/_repo/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_comm_app/main.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // ARRANGE
    Get.put(AppStateX());
    Get.put(CounterX());

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('I am count 0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // ACT
    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byKey(ValueKey("increment1")));
    await tester.pump();

    // ASSERT
    // Verify that our counter has incremented.
    expect(find.text('I am count 1'), findsOneWidget);
    // expect(find.text('1'), findsOneWidget);
  });
}
