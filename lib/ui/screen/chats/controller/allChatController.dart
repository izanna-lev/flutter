// import 'package:get/get.dart';
// import 'package:tralever_module/models/chats/chat_list_model.dart';
//
// import '../../../../models/chats/chat_list_model_2.dart';
// import '../../../../services/api_routes.dart';
// import '../../../../services/chats_repo/chatRepo.dart';
//
// class AllChatController extends GetxController {
//   int page = 1;
//
//   AllChatController() {
//     page = 1;
//   }
//   // List<ChatListModel> getChatList = [];
//   // Future<List<ChatListModel>> fetchAllChatList(int offset) async {
//   //   if (offset == 0) {
//   //     page = 1;
//   //     getChatList.clear();
//   //   }
//   //   if (page == -1) return [];
//   //   var request = await ChatRepo.getAllChatLIst(page);
//   //   var temp = request!.data;
//   //   getChatList.addAll(temp);
//   //   page = request.hasMore ? page + 1 : -1;
//   //   return temp;
//   // }
//   ///
//   int start = resourceAPIPaginationStart;
//   List<ChatListModel> _chatListDataModel = [];
//
//   List<ChatListModel> get chatListDataModel => _chatListDataModel;
//
//   set chatListDataModel(List<ChatListModel> value) {
//     _chatListDataModel = value;
//     update();
//   }
//
//   Future<List<ChatListModel>> fetchAllChatList(int offset) async {
//     if (offset == 0) start = resourceAPIPaginationStart;
//     if (start == 0) return [];
//     ChatModel? chatModel = (await ChatRepo.getAllChatLIst(
//       page: start,
//
//       ///
//       channelId: "",
//
//       /// channelid is reqqvaid
//     )) as ChatModel;
//     if (chatModel != null) {
//       chatListDataModel = chatModel.data;
//       if (chatModel.size < chatModel.limit) {
//         start = 0;
//       } else {
//         start += 1;
//       }
//       return chatListDataModel;
//     }
//
//     return [];
//   }
//
//   realAllMessagesLocally(ChatListModel chatListModel) {
//     // String lastMsg=allChatD.lastMessage.message;
//     chatListModel.unreadCount = 0;
//     // allChatData.lastMessage.message=allChatD.lastMessage.message;
//     update();
//   }
// }
