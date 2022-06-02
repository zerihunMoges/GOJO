import 'package:equatable/equatable.dart';
import '../../model/model.dart';

class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatLoading extends ChatState {}

class ChatsLoadSuccess extends ChatState {
  final List<Chat> chats;

  ChatsLoadSuccess([this.chats = const []]);

  @override
  List<Object> get props => [chats];
}

class ChatDeleteSuccessful extends ChatState {}

class ChatsLoadingFailure extends ChatState {
  final String failure = "Chat Loading Failure";
}
