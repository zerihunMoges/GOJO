import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gojo_flutter/auth/bloc/auth_bloc.dart';
import 'package:gojo_flutter/auth/index.dart';
import 'package:gojo_flutter/auth/repository/authentication_repository.dart';
import 'package:gojo_flutter/auth/screen/profilesetting.dart';
import 'package:gojo_flutter/database.dart';
// import 'package:gojo_flutter/pages/chats.dart';
// import 'package:gojo_flutter/pages/search.dart';
import './auth/screen/profile.dart';
import './chat_room/chat_room.dart';
import './chat_room/chat_room.dart';
import 'auth/screen/signup.dart';
import './post/post.dart';
import 'package:path/path.dart';

void main() {
  runApp(GOJO());
}

class GOJO extends StatelessWidget {
  GOJO({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = AuthBloc(AuthenticationRepo(AuthenticationRemote()));
    return BlocProvider<AuthBloc>(
      create: (context) => authBloc,
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is LoginSuccessful) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<AuthBloc>(
                  create: (context) => authBloc,
                ),
                BlocProvider<PostBloc>(
                  create: (context) => PostBloc(
                      PostRepository(dataProvider: PostDataProvider())),
                ),
                BlocProvider<MessageBloc>(
                  create: (context) => MessageBloc(MessageRepository(
                      MessageDataProvider(
                          state.userId.access_token.toString()))),
                ),
              ],
              child: MaterialApp.router(
                  routeInformationParser: _router.routeInformationParser,
                  routerDelegate: _router.routerDelegate),
            );
          }
          return MultiBlocProvider(
            providers: [
              BlocProvider<AuthBloc>(
                create: (context) => authBloc,
              ),
              BlocProvider<PostBloc>(
                create: (context) =>
                    PostBloc(PostRepository(dataProvider: PostDataProvider())),
              ),
            ],
            child: MaterialApp.router(
                routeInformationParser: _router.routeInformationParser,
                routerDelegate: _router.routerDelegate),
          );
        },
      ),
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: "/home",
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: "/post",
        builder: (context, state) => PostDetail(state.extra! as Post),
      ),
      GoRoute(
        path: "/profile",
        builder: (context, state) => Profile(state.extra! as User),
      ),
      GoRoute(
        path: "/settings",
        builder: (context, state) => ProfileSetting(state.extra! as User),
      ),
      GoRoute(
        path: "/signup",
        builder: (context, state) => BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            AuthenticationRepo(
              AuthenticationRemote(),
            ),
          ),
          child: SignUp(),
        ),
      ),
      GoRoute(
        path: "/admin",
        builder: (context, state) => AdminPage(),
      ),
      // GoRoute(
      //   path: "/search",
      //   builder: (context, state) => SearchPost(),
      // ),
      GoRoute(
        path: "/chats",
        builder: (context, state) => ChatList(),
      ),
      GoRoute(
        path: "/chat/:id",
        builder: (context, state) => BlocProvider<MessageBloc>(
          create: (context) => MessageBloc(MessageRepository(
              MessageDataProvider(state.queryParams['user']!)))
            ..add(LoadMessages(state.params["id"]!)),
          child: ChatDetail(state.queryParams['query']!, state.params["id"]!),
        ),
      ),
    ],
  );
}
