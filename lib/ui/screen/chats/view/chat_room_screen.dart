// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tralever_module/custem_class/constant/app_colors.dart';
// import 'package:tralever_module/custem_class/constant/app_icons.dart';
// import 'package:tralever_module/custem_class/constant/app_settings.dart';
// import 'package:tralever_module/ui/screen/chats/view/report_screen.dart';
// import 'package:tralever_module/ui/shared/image_picker_controller.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../../../custem_class/utils/globle.dart';
// import '../../../shared/request_form_textfild.dart';
//
// class ChatRoomScreen extends StatefulWidget {
//   static const String routeName = "/ChatRoomScreen";
//
//   const ChatRoomScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatRoomScreen> createState() => _ChatRoomScreenState();
// }
//
// class _ChatRoomScreenState extends State<ChatRoomScreen> {
//   TextEditingController chatController = TextEditingController();
//   // ImagePickerController imagePickerController =
//   //     Get.find<ImagePickerController>();
//   // AppImagePicker appImagePicker = Get.find<AppImagePicker>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.black,
//             size: 24,
//           ),
//         ),
//         title: const Text(
//           "Lisa Parker",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               handleMoreOption(context: context);
//             },
//             icon: const Icon(
//               Icons.more_vert,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity,
//             color: const Color(0xffF5F5F5),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: kDefaultPadding, vertical: kDefaultPadding),
//               child: Row(
//                 children: [
//                   Container(
//                     height: 41,
//                     width: 41,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: const DecorationImage(
//                         image: NetworkImage(
//                           "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg",
//                         ),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "30-Sep-2022",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 15,
//                           ),
//                         ),
//                         Text(
//                           "Niagara River into the Niagara Gorge; borborbor",
//                           maxLines: 1,
//                           style: TextStyle(
//                             overflow: TextOverflow.ellipsis,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//             child: Column(
//               children: [
//                 ///Admin
//                 Row(
//                   children: [
//                     Container(
//                       height: 31,
//                       width: 31,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         image: const DecorationImage(
//                           image: NetworkImage(
//                             "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg",
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Container(
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(20),
//                               bottomLeft: Radius.circular(20),
//                               topRight: Radius.circular(20),
//                             ),
//                             color: AppColors.appBlueColor,
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.only(
//                                 top: 10, bottom: 10, left: 10, right: 10),
//                             child: Text(
//                               "Hello Dear Smit",
//                               maxLines: 10,
//                               style: TextStyle(
//                                 overflow: TextOverflow.ellipsis,
//                                 color: Colors.white,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         const Text(
//                           "2 Jan,20, 10:50PM",
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 30),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//
//                 ///user
//                 Row(
//                   children: [
//                     const Spacer(),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Container(
//                           height: 150,
//                           width: 250,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             image: const DecorationImage(
//                               image: NetworkImage(
//                                   "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg"),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         const Text(
//                           "2 Jan,20, 10:50PM",
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//
//                 /// admin
//                 Row(
//                   children: [
//                     Container(
//                       height: 31,
//                       width: 31,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         image: const DecorationImage(
//                           image: NetworkImage(
//                             "https://images.allthingsnature.org/moss-on-stones-around-a-waterfall.jpg",
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Container(
//                           width: 250,
//                           decoration: const BoxDecoration(
//                             borderRadius: BorderRadius.only(
//                               bottomRight: Radius.circular(20),
//                               bottomLeft: Radius.circular(20),
//                               topRight: Radius.circular(20),
//                             ),
//                             color: AppColors.appBlueColor,
//                           ),
//                           child: const Padding(
//                             padding: EdgeInsets.only(
//                                 top: 10, bottom: 10, left: 10, right: 10),
//                             child: Text(
//                               "Hello Dear Smit are you there Hello Dear Smit are you thereHello Dear Smit are you there Hello Dear Smit are you there",
//                               maxLines: 10,
//                               style: TextStyle(
//                                 overflow: TextOverflow.ellipsis,
//                                 color: Colors.white,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         const Text(
//                           "2 Jan,20, 10:50PM",
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 30),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     const Spacer(),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             launch(
//                                 "https://www.google.com/search?q=dubai+city+tour&rlz=1C5CHFA_enIN984IN984&sxsrf=ALiCzsZOgGuUWl5vxY9BMl-Ol33now9o8A:1664009668669&source=lnms&tbm=isch&sa=X&ved=2ahUKEwikqNCJh636AhWFB7cAHThBDQkQ_AUoAXoECAIQAw&biw=1920&bih=881&dpr=1#imgrc=6ogHRhY0OVLDqM");
//                           },
//                           child: Container(
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(10),
//                                 topRight: Radius.circular(10),
//                                 bottomLeft: Radius.circular(10),
//                               ),
//                               color: Color(0xffF5F5F5),
//                             ),
//                             child: const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Text(
//                                 "www.dubai.com",
//                                 style: TextStyle(
//                                   decoration: TextDecoration.underline,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         const Text(
//                           "2 Jan,20, 10:50PM",
//                           style: TextStyle(fontSize: 12, color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton:
//           // Container(
//           //   width: double.infinity,
//           //   color: const Color(0xffF8F8F8),
//           //   child: const Padding(
//           //     padding: EdgeInsets.all(8.0),
//           //     child: Text(
//           //       "Note: You cannot chat with agent once trip is completed",
//           //       textAlign: TextAlign.center,
//           //       style: TextStyle(
//           //         fontSize: 14,
//           //         fontWeight: FontWeight.w600,
//           //       ),
//           //     ),
//           //   ),
//           // )
//           Padding(
//         padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
//         child: Row(
//           children: [
//             GestureDetector(
//               onTap: () {
//                 appImagePicker.openBottomSheet();
//               },
//               child: Image.asset(
//                 AppIcons.chatAddIcon,
//                 height: 21,
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: RequestFormTextfield(
//                 formFieldType: RequestFormFieldType.typehere,
//                 textCapitalization: TextCapitalization.sentences,
//                 textInputAction: TextInputAction.next,
//                 controller: chatController,
//                 // validator: (value) {
//                 //   if (value == null || value.isEmpty) {
//                 //     return "Please Enter Last Name";
//                 //   }
//                 //   return null;
//                 // },
//               ),
//             ),
//             const SizedBox(width: 10),
//             GestureDetector(
//                 onTap: () {},
//                 child: Image.asset(AppIcons.chatSendIcon, height: 40)),
//           ],
//         ),
//       ),
//     );
//   }
//
//   handleMoreOption({required BuildContext context}) async {
//     return showCupertinoModalPopup(
//       context: context,
//       builder: (BuildContext context) {
//         return CupertinoActionSheet(
//           actions: [
//             CupertinoActionSheetAction(
//               onPressed: () {
//                 Get.back();
//                 Get.toNamed(ReportScreen.routeName);
//               },
//               child: const Text(
//                 'Report Specialist',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//             CupertinoActionSheetAction(
//               onPressed: () {
//                 Get.back();
//               },
//               child: const Text(
//                 'Block User',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ],
//           cancelButton: CupertinoActionSheetAction(
//             isDefaultAction: true,
//             onPressed: () {
//               Get.back();
//             },
//             child: const Text(
//               'Cancel',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
