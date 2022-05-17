import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gojo_flutter/pages/chats.dart';

void main() {
  runApp(GOJO());
}

class GOJO extends StatelessWidget {
  GOJO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate);

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => Chats(),
      ),
    ],
  );
}
