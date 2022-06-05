import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gojo_flutter/auth/model/model.dart';
import 'package:gojo_flutter/auth/screen/profilesetting.dart';

void main() {
  testWidgets('MyWidget takes in a user object', (tester) async {
    User user = new User(
        id: '4',
        username: "name",
        name: 'namine',
        last_name: 'last_name',
        email: "email",
        access_token: "access",
        refresh_token: "refresh");

    await tester.pumpWidget(MaterialApp(
      home: ProfileSetting(user),
    ));


    expect(find.text(user.name), findsOneWidget);
    expect(find.text(user.username), findsOneWidget);
    expect(find.text(user.email), findsOneWidget);
    
    expect(find.text(user.access_token), findsNothing);
  });
}
