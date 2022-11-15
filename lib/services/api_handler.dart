import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as mimeee;
import 'package:mime_type/mime_type.dart';

import '../custem_class/constant/app_functions.dart';

import '../custem_class/utils/globle.dart';
import 'over&loding.dart';

enum RequestType { Get, Post }

class API {
  static late http.Response response;

  static Future<Map<String, dynamic>?> apiHandler({
    required String url,
    RequestType requestType = RequestType.Post,
    bool showLoader = true,
    bool showToast = false,
    dynamic body,
  }) async {
    try {
      if (await checkConnection()) {
        if (showLoader) LoadingOverlay.of().show();
        Map<String, String> header = {'Content-Type': 'application/json'};
        if (userController.userModel != null) {
          header
              .addAll({"Authorization": userController.userModel!.accessToken});
        }
        log("URl ===> $url");
        log("HEADER ===> $header");
        log("BODY ===> $body");
        if (requestType == RequestType.Get) {
          response = await http.get(
            Uri.parse(url),
            headers: header,
          );
        } else {
          response =
              await http.post(Uri.parse(url), headers: header, body: body);
        }
        log("RETURN RESPONSE BODY CREATE ====== ${response.body}");
        if (showLoader) LoadingOverlay.of().hide();
        if (response.body.isNotEmpty) {
          var res = jsonDecode(response.body);
          if (res["code"] == 100) {
            if (showToast) {
              flutterToast(res["message"]);
            }
            return res;
          } else if (res["code"] == 401) {
          } else {
            flutterToast(res["message"]);
            return null;
          }
        } else {
          return null;
        }
      } else {
        flutterToast('check_your_connection'.tr);
        return null;
      }
    } catch (e) {
      debugPrint("ERROR FROM API CLASS $e");
    }
  }

  static Future multiPartAPIHandler(
      {List<File>? fileImage,
      Map<String, String>? field,
      File? thumbnail,
      bool showLoader = true,
      String multiPartImageKeyName = "image",
      Map<String, String>? header,
      required String url,
      encoding}) async {
    try {
      bool connection = await checkConnection();

      if (connection) {
        log("URl ===> $url");

        log("BODY ===> $field");

        if (showLoader) LoadingOverlay.of().show();
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(url),
        );

        Map<String, String> header = {'Content-Type': 'form-data/multipart'};
        if (userController.userModel != null) {
          header
              .addAll({"Authorization": userController.userModel!.accessToken});
        }
        log("HEADER ===> $header");
        if (header != null) request.headers.addAll(header);
        if (field != null) request.fields.addAll(field);

        if (fileImage != null) {
          fileImage.forEach((element) async {
            String? mimeType = mime(element.path);
            debugPrint(mimeType);
            request.files.add(
              await http.MultipartFile.fromPath(
                multiPartImageKeyName,
                element.path,
                contentType: mimeee.MediaType(
                  mimeType!.split("/")[0],
                  mimeType.split("/")[1],
                ),
              ),
            );
          });
        }
        if (thumbnail != null) {
          request.files.add(await http.MultipartFile.fromPath(
              "thumbnailImage", thumbnail.path));
        }

        http.StreamedResponse response = await request.send();
        var res = await response.stream.bytesToString();

        var resDecode = jsonDecode(res);
        log("RETURN RESPONSE BODY CREATE ====== $resDecode");
        if (resDecode["code"] == 100) {
          if (showLoader) LoadingOverlay.of().hide();

          return resDecode;
        } else if (resDecode["code"] == 401) {
        } else {
          if (showLoader) LoadingOverlay.of().hide();
          debugPrint("erroe $resDecode");
          flutterToast(resDecode["message"]);

          return null;
        }
      } else {
        flutterToast('check_your_connection'.tr);
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
