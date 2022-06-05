import '../data_provider/data_provider.dart';
import '../model/model.dart';

class MessageRepository {
  final MessageDataProvider dataProvider;

  MessageRepository(this.dataProvider) : assert(dataProvider != null);

  Future<Message> createMessage(String chatId, Message message) async {
    return await dataProvider.createMessage(chatId, message);
  }

  Future<List<Message>> getMessages(String chatId) async {
    return await dataProvider.getMessages(chatId);
  }

  // Future<void> deleteMessage(Message message) async {
  //   await dataProvider.deleteMessage(message);
  // }
}
