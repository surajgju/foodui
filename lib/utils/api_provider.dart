import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIProvider {
   static const apiurl = "https://cssfounder.co.uk/CSS107/qconnect/api";
  // static const imageurl = "https://cssfounder.co.uk/CSS137/umr/uploads/";
  // static const noImage = "https://universeumr.com/icon/no-image.png";

  final dio =
      Dio(BaseOptions(baseUrl: apiurl));

  get({required url}) async {
    debugPrint("************REQUEST URL : $url ************");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token")!;
    try {
      final response = await dio.get(url,
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      print('************REQUEST uri: ${response.requestOptions.uri.toString()} ************');
      print('************REQUEST Headers: ${response.requestOptions.headers.toString()} ************');
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

    final response = await dio.post(url, data: payload);
    if (response.statusCode == 200) {
      return response;
    } else {
      responseInformer(response);
      return false;
    }
  }

  formRequest({required url, required FormData payload, noToken}) async {
    await intercepter(dio);
    debugPrint(
        "************REQUEST URL : $url \n REQUEST BODY : ${payload.fields}************");
    try {
      final response = await dio.post(
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
    } catch (err) {
      warningToast("$err");
      debugPrint(err.toString());
      return false;
    }
  }

  responseInformer(Response response) {
  var logger = Logger();
  logger.e("${response.statusCode.toString()}");
  }

  intercepter(Dio dio) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token") ?? "";
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["Authorization"] =
            token.isNotEmpty ? "Bearer $token" : "";
        // debugPrint('Request: ${options.method.toString()} ${options.uri.toString()}');
        // debugPrint('Headers: ${options.headers.toString()}');
        // if(options.data != null )debugPrint('Body: ${options.data.toString()}');
        //if(options.data != null )debugPrint('Body: ${options.data.fields.toString()}');
        handler.next(options);
      },
      // onResponse: ( response,  handler) {
      //   print('Response: ${response.statusCode}');
      //   print('Headers: ${response.headers}');
      //   print('Data: ${response.data}');
      //  handler.next(response);
      // },
      // onError: (DioError error, ErrorInterceptorHandler handler) {
      //   print('Error: ${error.response?.statusCode}');
      //   print('Message: ${error.message}');
      //   print('Error response: ${error.response}');
      //
      //   handler.next(error); // Pass the error to the next interceptor
      // },
    ));
  }


}
