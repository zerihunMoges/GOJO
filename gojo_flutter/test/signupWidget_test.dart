import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gojo_flutter/auth/index.dart';
import 'package:gojo_flutter/auth/screen/signup.dart';

void main() {
  testWidgets('MyWidget takes in text input', (tester) async {
    final formfinder = find.text('GOJO');
    final firstform = find.byKey(ValueKey("formtext"));
    final secondform = find.byKey(ValueKey("formtext2"));
    final thirdform = find.byKey(ValueKey("formtext3"));
    final fourthform = find.byKey(ValueKey("formtext4"));
    final fifthform = find.byKey(ValueKey("formtext5"));
    final sixthform = find.byKey(ValueKey("formtext6"));


    await tester.pumpWidget(MaterialApp(
      // home: SignUp(),
      home: BlocProvider(
        create: (_) => AuthBloc(AuthenticationRepo(AuthenticationRemote())),
        child: SignUp(),
      ),
    ));

    await tester.enterText(firstform, "hello");
    await tester.enterText(secondform, "world");
    await tester.enterText(thirdform, "thrid");
    await tester.enterText(fourthform, "fourth");
    await tester.enterText(fifthform, "fifth");
    await tester.enterText(sixthform, "sixth");

    await tester.pump();

    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(6));
    expect(find.text("hello"), findsOneWidget);
    expect(find.text("world"), findsOneWidget);
    expect(find.text("thrid"), findsOneWidget);
    expect(find.text("fourth"), findsOneWidget);
    expect(find.text("fifth"), findsOneWidget);
    expect(find.text("sixth"), findsOneWidget);
  });
}
