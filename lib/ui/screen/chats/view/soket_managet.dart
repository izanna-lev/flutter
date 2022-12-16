import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:tralever_module/models/chats/chat_list_model.dart';

import '../../../../custem_class/utils/globle.dart';
import '../../../../services/api_routes.dart';
import '../../base_screen/controller/base_screen_controller.dart';
import '../controller/chat_screen_controller.dart';
import '../controller/message_screen_controller.dart';

/// socketManager
class SocketManager {
  static IO.Socket? socket;
  static String channelRef = "";
  static List<String> channelRefList = [];
  static MessageScreenController messageScreenController =
      Get.find<MessageScreenController>();
  static ChatScreenController chatScreenController =
      Get.find<ChatScreenController>();
  static BaseScreenController baseScreenController =
      Get.find<BaseScreenController>();
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
      SocketManager.getMessagesListener();
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

  // static void subscribeChannel() {
  //   if (socket!.connected) {
  //     socket!.emit("subscribe_channel", channelRef);
  //   }
  // }

  static void subscribeChannel(MessageScreenController controller) {
    messageScreenController = controller;
    if (socket!.connected) {
      int index = channelRefList.indexWhere((element) => element == channelRef);
      if (index == -1) {
        socket!.emit("subscribe_channel", {
          "channelRef": channelRef,
          "id": userController.rowndSignInModel!.data.traveller.id
        });
      }
    }
  }

  static void unsubscribeChannel() {
    if (socket!.connected) {
      print("unsubscribeChannel Success");
      socket!.emit("unsubscribe_channel", {
        "channelRef": channelRef,
        "id": userController.rowndSignInModel!.data.traveller.id
      });
    }
  }

  static void subscribeUser() {
    if (socket!.connected) {
      socket!.emit("subscribe_user", {
        "userRef": userController.rowndSignInModel!.data.traveller.id,
        "channelRef": channelRef
      });
    }
  }
  // static void subscribeUser() {
  //   if (socket!.connected) {
  //     socket!.emit(
  //         "subscribe_user", userController.rowndSignInModel!.data.traveller.id);
  //   }
  // }

  static void sendMessage(Map message) {
    print("Emit sendMessage: ${message}");
    if (socket!.connected) {
      print("Emit Message: ${message}");
      socket!.emit('message', message);
    }
  }

  static void getMessagesListener() {
    print("getMessagesListener}");
    SocketManager.socket!.on('message', (data) {
      debugPrint("GET message $data");
      debugPrint("ChannelRef $channelRef");
      Message newMsg = Message.fromJson(data);

      if (newMsg.channelRef == channelRef) {
        updateMessageList(newMsg);
      }
      updateChatList(newMsg);
    });
  }

  static void updateMessageList(Message msg) {
    print("updateMessageList");
    messageScreenController.messageList.insert(0, msg);
    messageScreenController.isUpdateMessage = true;
    messageScreenController.update();
    messageScreenController.messageListKey.currentState?.refresh();
    Future.delayed(const Duration(milliseconds: 2), () {
      messageScreenController.isUpdateMessage = false;
    });
  }

  static void updateChatList(Message msg) {
    print("updateChatList $msg");
    List<ChatListModel> tempData = chatScreenController.chatData;

    final int index =
        tempData.indexWhere((element) => element.channelRef == msg.channelRef);
    if (index != -1) {
      tempData[index].message = msg;
      if (msg.channelRef == channelRef) {
        tempData[index].unseenMessages = false;
      } else {
        tempData[index].unseenMessages = true;
      }
    }
    tempData.sort((msg1, msg2) {
      if (msg1.message.createdOn.isNotEmpty &&
          msg2.message.createdOn.isNotEmpty) {
        return DateTime.parse(msg2.message.createdOn)
            .compareTo(DateTime.parse(msg1.message.createdOn));
      }
      return 0;
    });
    chatScreenController.chatData = tempData;
    chatScreenController.isUpdateMessage = true;
    chatScreenController.update();
    chatScreenController.chatListKey.currentState?.refresh();
    Future.delayed(const Duration(milliseconds: 2), () {
      chatScreenController.isUpdateMessage = false;
    });
    Future.delayed(const Duration(seconds: 2), () {
      int count = 0;
      for (int i = 0; i < chatScreenController.chatData.length; i++) {
        if (chatScreenController.chatData[i].unseenMessages) {
          count++;
        }
      }
      baseScreenController.chatUnreadCount = count;
    });
  }
}
