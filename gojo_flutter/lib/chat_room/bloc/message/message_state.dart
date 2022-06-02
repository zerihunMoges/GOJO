import 'package:equatable/equatable.dart';
import '../../model/model.dart';

class MessageState extends Equatable {
  const MessageState();

  @override
  List<Object> get props => [];
}

class MessageLoading extends MessageState {}

class MessagesLoadSuccess extends MessageState {
  final List<Message> messages;

  MessagesLoadSuccess([this.messages = const []]);

  @override
  List<Object> get props => [messages];
}

class MessageDeleteSuccessful extends MessageState {}

class MessagesLoadingFailure extends MessageState {
  final String failure = "Message Loading Failure";
}
