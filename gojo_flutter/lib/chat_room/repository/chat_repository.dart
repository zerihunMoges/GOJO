import '../data_provider/data_provider.dart';
import '../model/model.dart';

class ChatRepository {
  final ChatDataProvider dataProvider;

  ChatRepository(this.dataProvider) : assert(dataProvider != null);

  Future<Chat> createChat(Chat chat) async {
    return await dataProvider.createChat(chat);
  }

  Future<List<Chat>> getChats() async {
    return await dataProvider.getChats();
  }

  Future<void> deleteChat(Chat chat) async {
    await dataProvider.deleteChat(chat);
  }
}
