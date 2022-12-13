import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tralever_module/custem_class/constant/app_colors.dart';
import 'package:tralever_module/custem_class/constant/app_images.dart';
import 'package:tralever_module/models/chats/chat_list_model.dart';
import 'package:tralever_module/models/login/successModel.dart';
import 'package:tralever_module/services/api_routes.dart';
import 'package:tralever_module/services/chats_repo/chatRepo.dart';
import 'package:tralever_module/ui/screen/chats/controller/message_screen_controller.dart';
import 'package:tralever_module/ui/screen/chats/view/post_details_bottom_view.dart';
import 'package:tralever_module/ui/screen/chats/view/report_screen.dart';
import 'package:tralever_module/ui/screen/chats/view/soket_managet.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../custem_class/constant/app_functions.dart';
import '../../../../custem_class/constant/app_settings.dart';
import '../../../../custem_class/utils/globle.dart';
import '../../../../services/over&loding.dart';
import '../../../shared/bottomsheet.dart';
import '../controller/chat_screen_controller.dart';

class MessageScreen extends StatefulWidget {
  static const String routeName = "/MessageScreen";

  MessageScreen({Key? key}) : super(key: key);
  String channelRef = Get.arguments["channelRef"] ?? "";
  String otherUserRef = Get.arguments["specialistRef"] ?? "";
  String otherUsername = Get.arguments["specialistName"] ?? "";

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final MessageScreenController messageScreenController =
      Get.find<MessageScreenController>();
  final ChatScreenController chatScreenController =
      Get.find<ChatScreenController>();

  @override
  void initState() {
    print("Message Screen init");
    SocketManager.channelRef = widget.channelRef;
    SocketManager.subscribeChannel(messageScreenController);
    SocketManager.subscribeUser();
    messageScreenController.messageList = [];
    messageScreenController.getMessageList(0);
    super.initState();
  }

  refreshKey() {
    chatScreenController.chatListKey.currentState!.refresh();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: GetBuilder(builder: (MessageScreenController controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                    refreshKey();
                    print(
                        "-------?${chatScreenController.chatListKey.currentState!.refresh()}");
                  },
                  icon: const Icon(Icons.arrow_back, color: Colors.black)),
              centerTitle: true,
              title: Text(
                widget.otherUsername,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: [
                (controller.itinerary.itineraryStatus == 3 ||
                        controller.itinerary.itineraryStatus == 5)
                    ? const SizedBox()
                    : IconButton(
                        onPressed: () {
                          showMoreOption();
                        },
                        icon: const Icon(Icons.more_vert, color: Colors.black))
              ],
            ),
            body: WillPopScope(
              onWillPop: refreshKey(),
              child: widget.channelRef == "" && controller.messageList.isEmpty
                  ? GetPlatform.isAndroid
                      ? const Center(
                          child: CircularProgressIndicator(strokeWidth: 2))
                      : const Center(child: CupertinoActivityIndicator())
                  : Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                                child: PaginationView(
                              reverse: true,
                              key: controller.messageListKey,
                              scrollDirection: Axis.vertical,
                              physics: const AlwaysScrollableScrollPhysics(),
                              pullToRefresh: false,
                              bottomLoader: const AppLoader(),
                              itemBuilder: (BuildContext context,
                                  Message message, int index) {
                                return messageBoxView(message: message);
                              },
                              pageFetch: controller.getMessageList,
                              onEmpty: controller.messageList.isEmpty
                                  ? const Center(child: Text("No data found"))
                                  : Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              controller
                                                  .messageListKey.currentState!
                                                  .refresh();
                                            },
                                            icon: const Icon(
                                              Icons.refresh,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const Text("No data found"),
                                        ],
                                      ),
                                    ),
                              onError: (error) {
                                return const Center(
                                  child: Text("No comments here yet."),
                                );
                              },
                              initialLoader: GetPlatform.isAndroid
                                  ? const Center(
                                      child: AppLoader(),
                                    )
                                  : const Center(
                                      child: CupertinoActivityIndicator(),
                                    ),
                            )),
                            controller.itinerary.itineraryStatus == 3 ||
                                    controller.itinerary.itineraryStatus == 5
                                ? Container(
                                    width: double.infinity,
                                    color: const Color(0xffF8F8F8),
                                    child: const Padding(
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          left: 10,
                                          right: 10,
                                          bottom: 20),
                                      child: Text(
                                        "Note: You cannot chat with agent once trip is completed",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  )
                                : SafeArea(
                                    child: PostDetailsBottomView(
                                        comment: controller.messageText,
                                        send: () {
                                          if (controller.messageText.text
                                              .trim()
                                              .isNotEmpty) {
                                            Map message = {
                                              "message": controller
                                                  .messageText.text
                                                  .trim(),
                                              "channelRef": widget.channelRef,
                                              "id": userController
                                                  .rowndSignInModel!
                                                  .data
                                                  .traveller
                                                  .id,
                                              "messageType": 1,
                                              "type": 2
                                            };
                                            SocketManager.sendMessage(message);
                                            controller.messageText.text = "";
                                          } else {
                                            flutterToast("Please Enter Text");
                                          }
                                        },
                                        attachFile: () {
                                          //appImagePicker.tag = "message";
                                          //appImagePicker.openBottomSheet();
                                          bottomSheet();
                                        },
                                        hintText: 'Type Here'))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                width: double.infinity,
                                color: const Color(0xffF8F8F8),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 10, top: 10, bottom: 10, left: 10),
                                  child: Row(children: [
                                    Container(
                                      height: 41,
                                      width: 41,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: controller
                                                .itinerary.image.isNotEmpty
                                            ? DecorationImage(
                                                image: NetworkImage(imageUrl +
                                                    controller.itinerary.image),
                                                fit: BoxFit.cover)
                                            : DecorationImage(
                                                image: AssetImage(AppImages
                                                    .splashScreenBackgroundImage)),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(chatListDate(
                                            controller.itinerary.fromDate)),
                                        Text(controller
                                            .itinerary.location.location),
                                      ],
                                    )
                                  ]),
                                ),
                              ),
                            ),
                            Text("")
                          ],
                        )
                      ],
                    ),
            ));
      }),
    );
  }

  // onClickOnBack() {
  //   SocketManager.unsubscribeChannel();
  //   disposeKeyboard();
  // }
  messageBoxView({required Message message}) {
    if (message.userRef == userController.rowndSignInModel!.data.traveller.id) {
      // Right (my message)
      return message.messageType == 1
          ? Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.appBlueColor,
                        borderRadius: BorderRadius.circular(22)),
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(left: 50),
                    child: Linkify(
                      onOpen: (link) async {
                        if (await canLaunch(link.url)) {
                          await launch(link.url);
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      text: message.message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      linkStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 7),
                  // getHeightSizedBox(h: 7),
                  Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: Text(
                      DateTimeFormatExtension.displayMSGTimeFromTimestamp(
                          message.createdOn),
                      style: const TextStyle(
                          color: Color(0xff7C8392), fontSize: 11),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // getHeightSizedBox(h: 4),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                        color: AppColors.appBlueColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(2),
                    margin: const EdgeInsets.only(left: 50),
                    child: SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(imageUrl + message.message,
                                fit: BoxFit.cover))),
                  ),
                ),
                const SizedBox(height: 7),
                // getHeightSizedBox(h: 7),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: Text(
                    DateTimeFormatExtension.displayMSGTimeFromTimestamp(
                        message.createdOn),
                    style:
                        const TextStyle(color: Color(0xff7C8392), fontSize: 11),
                  ),
                ),
                const SizedBox(height: 4),
                // getHeightSizedBox(h: 4),
              ],
            );
    } else {
      // Left (defence message)

      return message.messageType == 1
          ? Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(22)),
                    margin: const EdgeInsets.only(right: 50),
                    padding: const EdgeInsets.all(15),

                    child: Linkify(
                      onOpen: (link) async {
                        if (await canLaunch(link.url)) {
                          await launch(link.url);
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      text: message.message,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      linkStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    // margin: const EdgeInsets.only(left: 10.0),
                  ),
                  // getHeightSizedBox(h: 7),
                  const SizedBox(height: 7),
                  Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: Text(
                      DateTimeFormatExtension.displayMSGTimeFromTimestamp(
                          message.createdOn),
                      style: const TextStyle(
                          color: Color(0xff7C8392), fontSize: 11),
                    ),
                  ),
                  // getHeightSizedBox(h: 4),
                  const SizedBox(height: 4)
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 80),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.appBlueColor,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(2),
                    child: SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrl + message.message,
                              fit: BoxFit.cover,
                            ))),
                  ),
                ),
                // getHeightSizedBox(h: 7),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    DateTimeFormatExtension.displayMSGTimeFromTimestamp(
                        message.createdOn),
                    style:
                        const TextStyle(color: Color(0xff7C8392), fontSize: 11),
                  ),
                ),
                // getHeightSizedBox(h: 4),
                const SizedBox(height: 4)
              ],
            );
    }
  }

  showMoreOption() async {
    disposeKeyboard();
    openBottomSheet(
        title1: "Report Specialist",
        title2: "Block User",
        onTap1: () {
          Get.back();
          Get.toNamed(ReportScreen.routeName, arguments: widget.otherUserRef);
        },
        onTap2: () async {
          Get.back();
          SuccessResponse? response = await ChatRepo.blockUser(
              specialistRef: widget.otherUserRef,
              itineraryRef: messageScreenController.itinerary.id);
          if (response != null) {
            Get.back();
          }
        });
  }

  ImagePicker imagePicker = ImagePicker();

  Future browseImage(ImageSource imageSource) async {
    try {
      final pickedFile =
          await imagePicker.pickImage(source: imageSource, imageQuality: 50);
      if (pickedFile != null) {
        CroppedFile? file = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            compressQuality: 100,
            maxHeight: 700,
            maxWidth: 700,
            compressFormat: ImageCompressFormat.jpg,
            uiSettings: [
              AndroidUiSettings(
                toolbarColor: Colors.white,
                toolbarTitle: "Image Cropper",
              ),
            ]);
        setState(() {
          if (file != null) {
            uploadImage(File(file.path));
          }
        });
      }
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  uploadImage(File image) async {
    SuccessModel? response =
        await messageScreenController.uploadTravellerChatImage(image);
    if (response != null) {
      Map message = {
        "message": response.data ?? "",
        "channelRef": widget.channelRef,
        "id": userController.rowndSignInModel!.data.traveller.id,
        "messageType": 2,
        "type": 2
      };
      SocketManager.sendMessage(message);
    }
  }

  Future<void> bottomSheet() async {
    if (Platform.isIOS) {
      await showCupertinoModalPopup<void>(
        context: Get.context as BuildContext,
        builder: (BuildContext context) => CupertinoActionSheet(
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
                child: const Text(
                  'Choose From Gallery',
                  style: TextStyle(color: Colors.black, fontFamily: kAppFont),
                ),
                onPressed: () async {
                  await browseImage(ImageSource.gallery);
                  Get.back();
                }),
            CupertinoActionSheetAction(
              child: const Text(
                'Open Camera',
                style: TextStyle(color: Colors.black, fontFamily: kAppFont),
              ),
              onPressed: () async {
                await browseImage(ImageSource.camera);
                Get.back();
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black, fontFamily: kAppFont),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      );
    } else {
      await Get.bottomSheet(
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  color: Color(0xffd6d6d6),
                ),
                child: ListTile(
                  /// leading: const Icon(Icons.photo_library, color: Colors.black),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )),
                  title: const Center(
                    child: Text(
                      'Choose From Gallery',
                      style: TextStyle(
                        fontFamily: kAppFont,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  tileColor: Colors.white,
                  onTap: () async {
                    await browseImage(ImageSource.gallery);
                    Get.back();
                  },
                ),
              ),
            ),
            const Divider(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: Color(0xffd6d6d6),
                ),
                child: ListTile(
                  /// leading: const Icon(Icons.photo_camera, color: Colors.black),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),

                  title: const Center(
                    child: Text(
                      'Open Camera',
                      style: TextStyle(
                        fontFamily: kAppFont,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  tileColor: Colors.white,
                  onTap: () async {
                    final cameraPermissionStatus =
                        await Permission.camera.status;
                    if (cameraPermissionStatus.isDenied) {
                      Permission.camera.request().then((value) async {
                        if (value.isPermanentlyDenied) {
                          await openAppSettings();
                        } else if (value.isDenied) {
                          Permission.camera.request();
                        } else if (value.isGranted) {
                          await browseImage(ImageSource.camera);
                        }
                      });
                    } else if (cameraPermissionStatus.isRestricted) {
                      await openAppSettings();
                    } else if (cameraPermissionStatus.isGranted) {
                      await browseImage(ImageSource.camera);
                    }

                    Get.back();
                  },
                ),
              ),
            ),
            const Divider(
              height: 0.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: ListTile(
                hoverColor: Colors.pink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onTap: () {
                  Get.back();
                },
                tileColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Cancel",
                      style: TextStyle(
                          fontFamily: kAppFont,
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        barrierColor: Colors.black.withOpacity(0.3),
      );
    }
  }
}
