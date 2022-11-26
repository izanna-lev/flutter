import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tralever_module/models/chats/chat_list_model.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../../services/api_routes.dart';
import '../controller/chat_screen_controller.dart';
import '../controller/message_screen_controller.dart';

/// socketManager
class SocketManager {
  static IO.Socket? socket;
  static String channelRef = "";
  static MessageScreenController messageScreenController =
      Get.find<MessageScreenController>();
  static ChatScreenController chatScreenController =
      Get.find<ChatScreenController>();
  static void connectSocket() {
    if (userController.rowndSignInModel == null) {
      print("USER NOT FOUND");
      return;
    }
    socket = IO.io(
        socketBaseUrl,
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()
            .setExtraHeaders({
              "authorization":
                  userController.rowndSignInModel!.data.accessToken.toString()
            })
            .setQuery(
                {"id": userController.rowndSignInModel!.data.traveller.id})
            .enableForceNew() // disable auto-connection
            .build());
    socket!.onConnect((_) {
      debugPrint(
          'socket connected ${userController.rowndSignInModel!.data.traveller.id}');
      getMessagesListener();
    });
    socket!.onConnecting((data) => debugPrint("SOCKET onConnecting $data"));
    socket!.onConnectError((data) => debugPrint("SOCKET onConnectError $data"));
    socket!.onError((data) => debugPrint("SOCKET onError $data"));
    socket!.onDisconnect((data) => debugPrint("SOCKET onDisconnect $data"));
    socket!.connect();
  }

  static void socketDisconnect() {
    if (socket != null) {
      socket!.disconnect();
      socket!.onDisconnect((data) => debugPrint("onDisconnect $data"));
    }
  }

  static void sendMessage(Map message) {
    if (socket!.connected) {
      print("Emit Message: ${message}");
      socket!.emit('message', message);
    }
  }

  static void getMessagesListener() {
    print("getMessagesListener");
    SocketManager.socket!.on('message', (data) {
      debugPrint("GET message $data");
      Message newMsg = Message.fromJson(data);
      if (newMsg.channelRef == channelRef) {
        updateMessageList(newMsg);
      }
      updateChatList(newMsg);
    });
  }

  static void updateMessageList(Message msg) {
    messageScreenController.messageList.add(msg);
  }

  static void updateChatList(Message msg) {
    List<ChatListModel> tempData = chatScreenController.chatData;
    final int index =
        tempData.indexWhere((element) => element.channelRef == channelRef);
    if (index != -1) {
      tempData[index].message = msg;
    }
    tempData.sort((msg1, msg2) {
      return DateTime.parse(msg1.message.createdOn)
          .compareTo(DateTime.parse(msg2.message.createdOn));
    });
    chatScreenController.chatData = tempData;
  }
}
