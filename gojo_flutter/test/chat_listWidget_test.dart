import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gojo_flutter/auth/index.dart';
import 'package:gojo_flutter/chat_room/chat_room.dart';

void main() {
  testWidgets('the widget test chat list', (tester) async {
    await tester.pumpWidget(MaterialApp(
        home: BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(AuthenticationRepo(AuthenticationRemote())),
            child:const ChatList())));

    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('Messages'), findsOneWidget);
    
  });
}
