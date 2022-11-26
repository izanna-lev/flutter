import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as mimeee;
import 'package:mime_type/mime_type.dart';
import 'package:tralever_module/custem_class/utils/globle.dart';

import '../custem_class/constant/app_functions.dart';
import 'over&loding.dart';

enum RequestType { Get, Post }

class API {
  static late http.Response response;

  static Future<Map<String, dynamic>?> apiHandler({
    required String url,
    RequestType requestType = RequestType.Post,
    bool showLoader = true,
    Map<String, String>? header,
    bool showToast = false,
    dynamic body,
  }) async {
    try {
      if (await checkConnection()) {
        if (showLoader) LoadingOverlay.of().show();
        // Map<String, String> header = {'Content-Type': 'application/json'};
        if (userController.rowndSignInDetailsModel != null) {
          if (header!["Authorization"] == null) {
            header?.addAll({
              "Authorization": userController.rowndSignInModel!.data.accessToken
            });
          }
          print(
              'USER-TOKEN${userController.rowndSignInModel!.data.accessToken}');
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
        log("RESPONSE ${url}  RETURN RESPONSE BODY CREATE ======> ${response.body}");
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

  static Future<Map<String, dynamic>?> cardAPICall({
    required String url,
    RequestType requestType = RequestType.Post,
    bool showLoader = true,
    Map<String, String>? header,
    bool showToast = false,
    dynamic body,
  }) async {
    if (await checkConnection()) {
      log("URl ===> $url");
      log("FIELD ===> $body");
      log("headers ===> $header");

      var request = http.Request('POST', Uri.parse(url));
      request.bodyFields = body;
      request.headers.addAll(header!);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String json = await response.stream.bytesToString();
        log("RETURN RESPONSE BODY ===> ${response.statusCode} ${jsonDecode(json)}");
        return jsonDecode(json);
      } else {
        print(response.reasonPhrase);
      }
    } else {}
    return null;
  }

  static Future multiPartAPIHandler(
      {List<File>? fileImage,
      Map<String, String>? field,
      File? thumbnail,
      bool showLoader = true,
      String multiPartImageKeyName = "image",
      Map<String, String>? header,
      required String url,
      required String token,
      encoding}) async {
    try {
      bool connection = await checkConnection();

      if (connection) {
        log("URl ===> $url");

        log("BODY ===> $field");
        print("before loading");
        if (showLoader) LoadingOverlay.of().show();
        print("after loading");

        var request = http.MultipartRequest(
          'POST',
          Uri.parse(url),
        );

        Map<String, String> header = {
          'Content-Type': 'form-data/multipart',
          // 'Content-Type': "application/x-www-form-urlencoded",
          'Authorization': token
        };
        if (userController.rowndSignInDetailsModel != null) {
          header.addAll({
            "Authorization": userController.rowndSignInModel!.data.accessToken
          });
          print(
              'USER-TOKEN${userController.rowndSignInModel!.data.accessToken}');
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
        log("MULTIPART RETURN RESPONSE BODY CREATE ====== $resDecode");
        if (resDecode["code"] == 100) {
          if (showLoader) LoadingOverlay.of().hide();
          flutterToast(resDecode["message"]);

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
