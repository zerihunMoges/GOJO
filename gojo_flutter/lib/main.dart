import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gojo_flutter/pages/admin/Screens/admin.dart';
import 'package:gojo_flutter/pages/chats.dart';
import 'package:gojo_flutter/pages/search.dart';

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
        path: "/admin",
        builder: (context, state) => AdminPage(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => SearchPost(),
      ),
      GoRoute(
        path: "/path",
        builder: (context, state) => Chats(),
      ),
    ],
  );
}
