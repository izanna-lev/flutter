// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pagination_view/pagination_view.dart';
// import 'package:tralever_module/custem_class/constant/app_images.dart';
// import 'package:tralever_module/ui/screen/chats/view/chatscreen.dart';
// import '../../../../custem_class/constant/app_settings.dart';
// import '../../../../models/chats/chat_list_model.dart';
// import '../controller/allChatController.dart';
//
// class AllMessages extends StatefulWidget {
//   static const String routeName = "/AllMessages";
//
//   static GlobalKey<PaginationViewState> paginationKey =
//       GlobalKey<PaginationViewState>();
//   @override
//   State<AllMessages> createState() => _AllMessagesState();
// }
//
// class _AllMessagesState extends State<AllMessages> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(builder: (AllChatController controller) {
//       return PaginationView(
//         pullToRefresh: true,
//         key: AllMessages.paginationKey,
//         physics: const AlwaysScrollableScrollPhysics(),
//         itemBuilder: (BuildContext context, allChatData, int index) =>
//             chatListTile(allChatData),
//         pageFetch: controller.fetchAllChatList,
//         onError: (error) {
//           return Center(child: Text(error));
//         },
//         onEmpty: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     AllMessages.paginationKey.currentState!.refresh();
//                   },
//                   icon: const Icon(Icons.restart_alt)),
//               const Text("No messages yet"),
//             ],
//           ),
//         ),
//         initialLoader: GetPlatform.isAndroid
//             ? const Center(
//                 child: CircularProgressIndicator(
//                 strokeWidth: 2,
//               ))
//             : const Center(child: CupertinoActivityIndicator()),
//       );
//     });
//   }
//
//   chatListTile(ChatListModel chatListModel) {
//     return GetBuilder(
//       builder: (AllChatController controller) => Column(
//         children: [
//           ListTile(
//             horizontalTitleGap: 12,
//             contentPadding:
//                 const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//             leading: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: FadeInImage(
//                     /// placeholder: AssetImage(AppImages.placeHolder),
//                     placeholder:
//                         const AssetImage(AppImages.loginBackgroundImage),
//                     image: NetworkImage(chatListModel.image),
//
//                     /// image: NetworkImage("${imageUrl + chatListModel.image}"),
//                     fit: BoxFit.cover,
//                     imageErrorBuilder: (context, error, stackTrace) {
//                       return Image.asset(
//                         AppImages.loginBackgroundImage,
//
//                         /// AppImages.placeHolder,
//                         height: 40,
//                         width: 40,
//                         fit: BoxFit.cover,
//                       );
//                     },
//                     height: 40,
//                     width: 40,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   right: -3,
//                   child:
//                       // allChatData.unreadCount == 0
//                       //     ? const SizedBox()
//                       //     :
//                       const CircleAvatar(
//                     //radius: getProportionateScreenWidth(8),
//                     radius: 8,
//                     backgroundColor: Colors.white,
//                     child: Center(
//                       child: CircleAvatar(
//                         // radius: getProportionateScreenWidth(6.5),
//                         radius: 6,
//                         backgroundColor: Color(0xff8BC53F),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             subtitle: Text(
//               chatListModel.message.channelRef,
//               // chatListModel.fromDate,
//
//               /// allChatData.lastMessage.message,
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 //fontSize: getProportionateScreenWidth(13),
//                 fontSize: 13,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.red,
//               ),
//             ),
//             title: Text(
//               ///allChatData.chatUserDetail.name,
//               chatListModel.id,
//               style: const TextStyle(
//                 fontWeight: FontWeight.w700,
//                 // fontSize: getProportionateScreenWidth(15)),
//                 fontSize: 15,
//               ),
//             ),
//             onTap: () {
//               Get.to(() => ChatView(
//                     channelRef: chatListModel.channelRef,
//                     businessRef: chatListModel.id,
//                     userName: chatListModel.location.toString(),
//                   ));
//               controller.realAllMessagesLocally(chatListModel);
//             },
//             trailing: Padding(
//               padding: const EdgeInsets.only(bottom: 11),
//               child: Text(
//                 chatListModel.location.toString(),
//                 // DateTimeFormatExtension.displayMSGTimeFromTimestamp(
//                 //     chatListModel.location.toString(),
//                 style: const TextStyle(
//                   // fontSize: getProportionateScreenWidth(13),
//                   fontSize: 13,
//                   color: Colors.green,
//                 ),
//               ),
//             ),
//           ),
//           const Divider(
//             height: 0,
//             thickness: 1,
//             // color: AppColor.kDefaultFontColor.withOpacity(0.08),
//             color: Colors.purple,
//           ),
//         ],
//       ),
//     );
//   }
// }
