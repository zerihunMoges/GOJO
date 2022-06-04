import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gojo_flutter/auth/index.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('MyWidget has a title and message', (tester) async {
    final formfinder = find.text("Sign in to your account");
    final firstform = find.byKey(ValueKey("formtext"));
    final secondform = find.byKey(ValueKey("formtext2"));
    final button = find.byKey(ValueKey("button"));

    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
    ));

    await tester.enterText(firstform, "hello");
    await tester.enterText(secondform, "world");

    await tester.tap(button);

    await tester.pump();

    expect(formfinder, findsOneWidget);
    expect(find.text("hello"), findsOneWidget);
    expect(find.text("world"), findsOneWidget);
  });
}
