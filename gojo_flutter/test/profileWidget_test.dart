// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gojo_flutter/auth/model/model.dart';
import 'package:gojo_flutter/auth/screen/profile.dart';

void main() {
  testWidgets('MyWidget display details', (tester) async {
    User user = new User(
        id: '4',
        username: "name",
        name: "namine",
        last_name: "last_name",
        email: "email",
        access_token: "access",
        refresh_token: "refresh");

    await tester.pumpWidget(MaterialApp(
      home: Profile(user),
    ));

    await tester.pump();
    expect(find.text("Edit Profile"), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('User Name'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    // expect(find.text(user.last_name), findsOneWidget);
  });
}
