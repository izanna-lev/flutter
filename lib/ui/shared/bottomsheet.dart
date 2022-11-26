import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tralever_module/custem_class/constant/app_settings.dart';

openBottomSheet(
    {required String title1,
    required String title2,
    required void Function() onTap1,
    required void Function() onTap2}) {
  return Get.bottomSheet(
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
                shape: (title2.trim().isNotEmpty)
                    ? const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ))
                    : const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                title: Center(
                  child: Text(
                    title1,
                    style: const TextStyle(
                      fontFamily: kAppFont,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                tileColor: Colors.white,
                onTap: onTap1),
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
            child: title2.trim().isNotEmpty
                ? ListTile(

                    /// leading: const Icon(Icons.photo_camera, color: Colors.black),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    title: Center(
                      child: Text(
                        title2,
                        style: const TextStyle(
                          fontFamily: kAppFont,
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    tileColor: Colors.white,
                    onTap: onTap2)
                : const SizedBox(),
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
              borderRadius: BorderRadius.circular(10),
            ),
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
                    fontWeight: FontWeight.w500,
                  ),
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
