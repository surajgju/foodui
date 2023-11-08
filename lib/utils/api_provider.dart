
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodui/utils/snackbar.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APIProvider {
  static const apiurl = "https://qconnectglobal.com/api";
 // static const apiurl = "https://cssfounder.co.uk/qconn/qconnect/api";

  final dio = Dio(BaseOptions(baseUrl: apiurl));

  get({required url, authToken}) async {
    if(authToken != null &&authToken != false  ){
      await intercepter(dio);
    }

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
    // dio.interceptors.add(ChuckerDioInterceptor());
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
    await intercepter(dio,noToken: noToken);
   // dio.interceptors.add(ChuckerDioInterceptor());

    debugPrint(
        "************REQUEST URL : $url \n REQUEST BODY : ${payload.fields}************");
try{
      var response = await dio.post(
        // options:options ,
        url, data: payload,
      );
      print("raw_response : $response");
      if (response.statusCode == 200) {
         print("response : $response");
        return response;
      } else if (response != false && response.data["status"] == false) {
        warningToast("${response.data["message"]}");
      } else {
        warningToast("internal server error");
        responseInformer(response);
        return false;
      }
  } catch (err) {
  var logger = Logger();
  logger.e(err);
  }
  }

  responseInformer(Response response) {
    var logger = Logger();
    logger.e(response.statusCode.toString());
  }

  intercepter(Dio dio,{bool? noToken}) async {
    final logger = Logger();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = noToken != null && noToken ? await prefs.getString("otp_token") ?? "" : await prefs.getString("token")?? "";
    // dio.interceptors.add(ChuckerDioInterceptor());
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["Authorization"] =
            token.isNotEmpty ? "Bearer $token" : "";
       // if(kDebugMode){
          logger.i('Request: ${options.method.toString()} ${options.uri.toString()}');
          logger.i('Headers: ${options.headers.toString()}');
          if(options.data != null ) logger.i('Body: ${options.data.toString()}');
      //  }
        logger.i('Request: ${options.method.toString()} ${options.uri.toString()}');
      //  logger.i('Request Body: ${options.data.fields.toString()}');
       // if(options.data != null )logger.i('Body: ${options.data.toString()}');
       //  if(options.data != null )logger.i('Body: ${options.data.fields.toString()}');
        handler.next(options);
      },

      onResponse: (Response response,  handler) {
   // if(kDebugMode){
      logger.i('Response: ${response.statusCode}');
        logger.i('Headers: ${response.headers}');
       // logger.i('Data: ${response.data}');
    logger.i('Raw Response: ${response.toString()}');
    handler.next(response);
   //   }
    },
      onError: (DioException error, ErrorInterceptorHandler handler) {
    //if(kDebugMode) {
      logger.e('Error: ${error.response?.statusCode}');
      logger.e('Message: ${error.message}');
      logger.e('Error response: ${error.response}');
 //   }
        handler.next(error); // Pass the error to the next interceptor
      },
    ));
  }
}
