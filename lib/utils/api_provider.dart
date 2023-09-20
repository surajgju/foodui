import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIProvider {
  static const apiurl = "https://cssfounder.co.uk/CSS133/qconnect/api";
  // static const imageurl = "https://cssfounder.co.uk/CSS137/umr/uploads/";
  // static const noImage = "https://universeumr.com/icon/no-image.png";

  final dio = Dio(BaseOptions(baseUrl: apiurl));

  get({required url}) async {
    debugPrint("************REQUEST URL : $url ************");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token")!;
    try {
      final response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      print(
          '************REQUEST uri: ${response.requestOptions.uri.toString()} ************');
      print(
          '************REQUEST Headers: ${response.requestOptions.headers.toString()} ************');
      print('************REQUEST Headers: ${response.data} ************');

      if (response.statusCode == 200) {
        return response;
      } else {
        warningToast("${response.data["message"]}");
        responseInformer(response);
        return false;
      }
    } catch (err) {
      warningToast("$err");
    }
  }

  post({required url, required payload}) async {
     await intercepter(dio);
    debugPrint(
        "************REQUEST URL : $url \n REQUEST BODY : $payload************");
    try {
      final response = await dio.post(url, data: payload);
      if (response.statusCode == 200) {
        return response;
      } else {
        responseInformer(response);
        return false;
      }
    } catch (err) {
      var logger = Logger();
      logger.e(err);
    }
  }

  formRequest({required url, required FormData payload, noToken}) async {
    await intercepter(dio);
    debugPrint(
        "************REQUEST URL : $url \n REQUEST BODY : ${payload.fields}************");

      var response = await dio.post(
        // options:options ,
        url, data: payload,
      );
      if (response.statusCode == 200) {
        // print("response : $response");
        return response;
      } else if (response != false && response.data["status"] == false) {
        warningToast("${response.data["message"]}");
      } else {
        warningToast("internal server error");
        responseInformer(response);
        return false;
      }

  }

  responseInformer(Response response) {
    var logger = Logger();
    logger.e("${response.statusCode.toString()}");
  }

  intercepter(Dio dio) async {
    final logger = Logger();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token") ?? "";
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["Authorization"] =
            token.isNotEmpty ? "Bearer $token" : "";
        if(kDebugMode){
          logger.i('Request: ${options.method.toString()} ${options.uri.toString()}');
          logger.i('Headers: ${options.headers.toString()}');
          if(options.data != null ) logger.i('Body: ${options.data.toString()}');
        }
        // debugPrint('Request: ${options.method.toString()} ${options.uri.toString()}');
        // debugPrint('Headers: ${options.headers.toString()}');
        // if(options.data != null )debugPrint('Body: ${options.data.toString()}');
        //if(options.data != null )debugPrint('Body: ${options.data.fields.toString()}');
        handler.next(options);
      },

      onResponse: (Response response,  handler) {
    if(kDebugMode){ logger.i('Response: ${response.statusCode}');
        logger.i('Headers: ${response.headers}');
        logger.i('Data: ${response.data}');
       handler.next(response);
      }},
      onError: (DioException error, ErrorInterceptorHandler handler) {
    if(kDebugMode) {
      logger.i('Error: ${error.response?.statusCode}');
      logger.i('Message: ${error.message}');
      logger.i('Error response: ${error.response}');
    }
        handler.next(error); // Pass the error to the next interceptor
      },
    ));
  }
}
