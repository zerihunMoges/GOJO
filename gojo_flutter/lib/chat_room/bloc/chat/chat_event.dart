import 'package:equatable/equatable.dart';
import '../../model/model.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class LoadChats extends ChatEvent {
  const LoadChats();

  @override
  List<Object> get props => [];
}

class CreateChat extends ChatEvent {
  final Chat chat;

  const CreateChat(this.chat);

  @override
  List<Object> get props => [chat];

  @override
  String toString() => 'Chat Created {Chat: $chat}';
}

class UpdateChat extends ChatEvent {
  final Chat chat;

  const UpdateChat(this.chat);

  @override
  List<Object> get props => [chat];

  @override
  String toString() => 'Chat Updated {Chat: $chat}';
}

class DeleteChat extends ChatEvent {
  final Chat chat;

  const DeleteChat(this.chat);

  @override
  List<Object> get props => [chat];

  @override
  toString() => 'Chat Deleted {Chat: $chat}';
}
