import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:tralever_module/services/chats_repo/chat_repo.dart';

import '../../../../custem_class/utils/globle.dart';
import '../../../../models/chats/chat_list_model.dart';
import '../../../../services/api_routes.dart';
import '../../../../services/chats_repo/chatRepo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreenController extends GetxController {
  int start = resourceAPIPaginationStart;
  GlobalKey<PaginationViewState> chatListKey = GlobalKey<PaginationViewState>();
  List<ChatListModel> _chatData = [];

  List<ChatListModel> get chatData => _chatData;

  set chatData(List<ChatListModel> value) {
    _chatData = value;
    update();
  }

  Future<List<ChatListModel>> userChatListData(int offset) async {
    if (offset == 0) start = resourceAPIPaginationStart;
    if (start == 0) return [];
    ChatModel? chatModel = await ChatScreenRepo.chatScreenRepo(
      page: start,
    );
    if (chatModel != null) {
      chatData = chatModel.data;
      if (chatModel.size < chatModel.limit) {
        start = 0;
      } else {
        start += 1;
      }
      return chatData;
    }

    return [];
  }

  ///
  ///
  /// chat Screen

  String businessRef = "";
  String channelRef = "";
  List<Message> getMessages = [];
  final TextEditingController messageText = TextEditingController();
  Future sendMessages() async {
    String msg = messageText.text.trim();
    messageText.clear();
    debugPrint("sendMessages");
    SocketManager.socket!.emit('message', {
      "channelRef": channelRef,
      "message": msg,
      "id": userController.userModel!.user.id
    });
  }
}

/// socketManager
class SocketManager {
  static IO.Socket? socket;
  static void connectSocket(Function onConnect) {
    socket = IO.io(
        socketBaseUrl,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .setExtraHeaders({
              "authorization": userController.userModel!.accessToken.toString()
            })
            .setQuery({"id": userController.userModel!.user.id})
            .disableAutoConnect()
            .enableForceNew() // disable auto-connection
            .build());
    socket!.connect();

    socket!.onConnect((_) {
      debugPrint('connectted');
      onConnect();
    });
    socket!.onConnecting((data) => debugPrint("onConnecting ${data}"));
    socket!.onConnectError((data) => debugPrint("onConnectError ${data}"));
    socket!.onError((data) => debugPrint("onError ${data}"));
    socket!.onDisconnect((data) => debugPrint("onDisconnect $data"));
  }

  static void socketDisconnect() {
    if (SocketManager.socket != null) {
      SocketManager.socket!.disconnect();
      socket!.onDisconnect((data) => debugPrint("onDisconnect $data"));
    }
  }
}

/////////////////////////////////
/////////////////////////////////
/////////////////////////////////
//   final TextEditingController messageText = TextEditingController();
//
//   Location? location;
//
//   String businessRef = "";
//   String channelRef = "";
//   Future fetchChannel() async {
//     SocketManager.socketDisconnect();
//     SocketManager.connectSocket(() async {
//       debugPrint("getChannel...");
//       if (channelRef == "") {
//         var response = await ChatRepo.getChannel(businessRef);
//         channelRef = response["data"]["channelId"];
//       }
//       connectChannelToSocket();
//       setupSocketListener();
//
//       ///     fetchMessages();
//     });
//   }
//
//   void setupSocketListener() {
//     debugPrint("setupSocketListener...");
//     readAllMsg();
//     SocketManager.socket!.on('message', (data) {
//       debugPrint("GET message ${data}");
//       readAllMsg();
//       var messageData = ChatListModel(
//         id: '', channelRef: '', itineraryStatus: 2, fromDate: '', image: '',location: "",
//         // location: "",
//         unseenMessages: false,
//
//         // createdAt: DateTime.parse(data["createdOn"]),
//         // userId: data["userId"],
//         // picture: "",
//         // message: data["message"],
//       );
//       getMessages.insert(0, messageData);
//       location = Location(
//         location: '', type: '', coordinates: [],
//         // message: messageData.message,
//         // createdAt: messageData.createdAt,
//         // user: User(
//         //     name: '', id: messageData.userId, picture: '', businessName: ''),
//       );
//
//       debugPrint("ON MSG ARR ${getMessages.length}");
//       update();
//     });
//   }
//
//   void readAllMsg() {
//     SocketManager.socket!.emit('read_all',
//         {"channelRef": channelRef, "id": userController.userModel!.user.id});
//   }
//
//   late bool _hasNext;
//   bool _isFetching = false;
//   bool get hasNext => _hasNext;
//   int page = 0;
//
//   List<ChatListModel> getMessages = [];
//   // Future fetchMessages() async {
//   //   page = 0;
//   //   _isFetching = false;
//   //   getMessages.clear();
//   //   await fetchNextMessages();
//   // }
//
//   // Future fetchNextMessages() async {
//   //   if (_isFetching) return;
//   //   _isFetching = true;
//   //   page++;
//   //   var request =
//   //       await ChatRepo.getAllMessages(page: page, channelRef: channelRef);
//   //   getMessages.addAll(request!.data.map((e) => e));
//   //   if (getMessages.isNotEmpty) {
//   //     location = Location(
//   //       location: getMessages.first, type: "1", coordinates: [],
//   //       // user: User(
//   //       //   name: '',
//   //       //   id: getMessages.first.id,
//   //       //   picture: '',
//   //       //   businessName: '',
//   //       // ),
//   //     );
//   //   }
//   //
//   //   _hasNext = request.hasMore;
//   //   _isFetching = false;
//   //   update();
//   // }
//
//   Future sendMessages() async {
//     String msg = messageText.text.trim();
//     messageText.clear();
//     debugPrint("sendMessages");
//     SocketManager.socket!.emit('message', {
//       "channelRef": channelRef,
//       "message": msg,
//       "id": userController.userModel!.user.id,
//     });
//   }
//
//   connectChannelToSocket() {
//     debugPrint("connectChannelToSocket");
//     SocketManager.socket!.emit("subscribe_channel", {"channelRef": channelRef});
//     SocketManager.socket!
//         .emit("subscribe_user", {"userRef": userController.userModel!.user.id});
//   }
//
//   @override
//   void dispose() {
//     SocketManager.socketDisconnect();
//
//     super.dispose();
//   }
// }
//
// class SocketManager {
//   static IO.Socket? socket;
//   static void connectSocket(Function onConnect) {
//     socket = IO.io(
//         socketBaseUrl,
//         IO.OptionBuilder()
//             .setTransports(['websocket']) // for Flutter or Dart VM
//             .setExtraHeaders(
//                 {"authorization": userController.userModel!.accessToken})
//             .setQuery({"id": userController.userModel!.user.id})
//             .disableAutoConnect()
//             .enableForceNew() // disable auto-connection
//             .build());
//     socket!.connect();
//
//     socket!.onConnect((_) {
//       debugPrint('connectted');
//       onConnect();
//     });
//     socket!.onConnecting((data) => debugPrint("onConnecting $data"));
//     socket!.onConnectError((data) => debugPrint("onConnectError $data"));
//     socket!.onError((data) => debugPrint("onError $data"));
//     socket!.onDisconnect((data) => debugPrint("onDisconnect $data"));
//   }
//
//   static void socketDisconnect() {
//     if (SocketManager.socket != null) {
//       SocketManager.socket!.disconnect();
//       socket!.onDisconnect((data) => debugPrint("onDisconnect $data"));
//     }
//   }
