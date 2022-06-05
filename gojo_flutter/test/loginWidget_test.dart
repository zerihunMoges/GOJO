import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gojo_flutter/auth/index.dart';

void main() {
  testWidgets('the Widget authenticate users', (tester) async {
    // final formfinder = find.text("Email");
    final firstform = find.byKey(const ValueKey("formtext"));
    final secondform = find.byKey(const ValueKey("formtext2"));
    final button = find.byKey(ValueKey("button"));

    await tester.pumpWidget(MaterialApp(
      home: BlocProvider(
        create: (_) => AuthBloc(AuthenticationRepo(AuthenticationRemote())),
        child: LoginPage(),
      ),
    ));

  
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(Image), findsOneWidget);
    expect(find.text("Sign in to your account"), findsOneWidget);
  });
}
