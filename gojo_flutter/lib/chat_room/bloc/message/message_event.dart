import 'package:equatable/equatable.dart';
import '../../model/model.dart';

abstract class MessageEvent extends Equatable {
  const MessageEvent();
}

class LoadMessages extends MessageEvent {
  final String chatId;
  const LoadMessages(this.chatId);

  @override
  List<Object> get props => [];
}

class CreateMessage extends MessageEvent {
  final Message message;
  final String chatId;

  const CreateMessage(this.chatId, this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Message Created {Message: $message}';
}

// class UpdateMessage extends MessageEvent {
//   final Message Message;

//   const UpdateMessage(this.Message);

//   @override
//   List<Object> get props => [Message];

//   @override
//   String toString() => 'Message Updated {Message: $Message}';
// }

class DeleteMessage extends MessageEvent {
  final Message message;
  final String chatId;

  const DeleteMessage(this.chatId, this.message);

  @override
  List<Object> get props => [message];

  @override
  toString() => 'Message Deleted {Message: $message}';
}
