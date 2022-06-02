import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gojo_flutter/pages/admin/Screens/admin.dart';
// import 'package:gojo_flutter/pages/chats.dart';
import 'package:gojo_flutter/pages/search.dart';
import './chat_room/chat_room.dart';
import './chat_room/chat_room.dart';

void main() {
  runApp(GOJO());
}

class GOJO extends StatelessWidget {
  GOJO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<ChatBloc>(
            create: (BuildContext context) =>
                ChatBloc(ChatRepository(ChatDataProvider())),
          ),
        ],
        child: MaterialApp.router(
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate),
      );

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/admin",
        builder: (context, state) => AdminPage(),
      ),
      GoRoute(
        path: "/search",
        builder: (context, state) => SearchPost(),
      ),
      GoRoute(
        path: "/",
        builder: (context, state) => ChatList(),
      ),
      GoRoute(
        path: "/chat/:id",
        builder: (context, state) => BlocProvider(
          create: (context) =>
              MessageBloc(MessageRepository(MessageDataProvider()))
                ..add(LoadMessages(state.params["id"]!)),
          child: ChatDetail(),
        ),
      ),
    ],
  );
}
