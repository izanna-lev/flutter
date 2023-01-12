import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../custem_class/constant/app_settings.dart';

class ImagePickerController extends GetxController {
  String? tag;

  String _image = "";
  String get image => _image;
  set image(String value) {
    _image = value;
    // userController.updateProfilePic(image);
    update();
  }

  void resetImage() {
    image = "";
  }

  ImagePickerController({this.tag});
}

class AppImagePicker {
  ImagePicker imagePicker = ImagePicker();
  String? tag;
  late ImagePickerController _imagePickerController;

  ImagePickerController get imagePickerController =>
      Get.find<ImagePickerController>(tag: tag);

  AppImagePicker({String? tag}) {
    tag = tag;
    _imagePickerController = Get.put(ImagePickerController(tag: tag), tag: tag);
  }

  update() {
    _imagePickerController.update();
  }

  Future browseImage(ImageSource imageSource) async {
    try {
      const dimension = 512.0;
      XFile? pickedFile =
      await imagePicker.pickImage(source: imageSource, maxHeight: dimension,
          maxWidth: dimension);
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
        if (file != null) {
          imagePickerController.image = file.path;
        }
      }
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
  //
  // Future browseImage(ImageSource imageSource) async {
  //   try {
  //     var pickedFile =
  //         await imagePicker.pickImage(source: imageSource, imageQuality: 50);
  //     CroppedFile? file = await ImageCropper().cropImage(
  //       sourcePath: pickedFile!.path,
  //       aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  //       compressQuality: 100,
  //       maxHeight: 700,
  //       maxWidth: 700,
  //       compressFormat: ImageCompressFormat.jpg,
  //       uiSettings: [
  //         AndroidUiSettings(
  //           toolbarColor: Colors.white,
  //           toolbarTitle: "Image Cropper",
  //         )
  //       ],
  //     );
  //     imagePickerController.image = file!.path;
  //   } on Exception catch (e) {
  //     return Future.error(e);
  //   }
  // }

  Future<void> openBottomSheet() async {
    if (Platform.isIOS) {
      await showCupertinoModalPopup<void>(
        context: Get.context as BuildContext,
        builder: (BuildContext context) => CupertinoActionSheet(
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
                child: const Text(
                  'Camera',
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () async {
                  await browseImage(ImageSource.camera).catchError((e) async {
                    await openAppSettings();
                  });

                  Get.back();
                }),
            CupertinoActionSheetAction(
              child: const Text(
                'Gallery',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () async {
                await browseImage(ImageSource.gallery);
                Get.back();
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
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
  }
}
