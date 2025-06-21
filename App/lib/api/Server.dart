
import 'dart:io';

import 'package:app/modules/login/wrappers/RequestLogin.dart';
import 'package:app/modules/login/wrappers/ResponseLogin.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_prefs_cookie_store/shared_prefs_cookie_store.dart';
import '../core/SharedPrefrenceSessionManager.dart';
import '../api/Api.dart';

// typedef ErrorCallback = void Function();

class Server {

  Dio dio = Dio();
  Api? api;
  final SharedPrefCookieStore _cookieStore = SharedPrefCookieStore();
  final cookieJar = CookieJar();
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // final ErrorCallback errorCallback;


  Server(){
    ///Comment for cookie hide
    cookieJar.ignoreExpires;
    dio.interceptors.add(CookieManager(_cookieStore));
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(CustomInterceptors());
    // dio.interceptors.add(CustomInterceptors(errorCallback));
    ///Comment for cookie hide
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          PreferenceUtils.init();
          if (Platform.isAndroid) {
            options.headers['x-app-package-name'] = dotenv.env['xAppPackageName'];
          } else if (Platform.isIOS) {
            options.headers['x-app-bundle-id'] = dotenv.env['xAppBundleId'];
          }
          ///Comment for cookie hide
          options.headers['custom-user-agent'] =
          "operating_system=${PreferenceUtils.getString("wagameal_device_info_operating_system")};"
              "device_id=${PreferenceUtils.getString("wagameal_device_info_uuid")}/${PreferenceUtils.getString("wagameal_device_info_device_id")};"
              "screen_resolution=${PreferenceUtils.getString("wagameal_device_info_screen_resolution")};"
              "ip_address=${PreferenceUtils.getString("wagameal_device_info_ip_address")}";
          debugPrint("--------options.headers['custom-user-agent']==${options.headers['custom-user-agent']}");
          ///Comment for cookie hide
          return handler.next(options);
        },
      ),
    );
    dio.options.connectTimeout =  const Duration(seconds: 15);
    dio.options.receiveTimeout =  const Duration(seconds: 12);
    // dio.options.baseUrl = baseURL;
    dio.options.baseUrl = dotenv.env['baseURL']!;
    dio.options.contentType = 'application/json';
    dio.options.headers['content-Type'] = 'application/json';
    api = Api(dio,baseUrl: dotenv.env['baseURL']!);
  }

  Future<ResponseLogin> userLogin(RequestLogin request) async {
    ResponseLogin response = await api!.userLogin(request);
    return response;
  }
  Future<ResponseLogin> userLoginVerify(RequestLogin request) async {
    ResponseLogin response = await api!.userLoginVerify(request);
    return response;
  }



}


  class CustomInterceptors extends Interceptor {
    // final ErrorCallback errorCallback;
    // CustomInterceptors(this.errorCallback);
    CustomInterceptors();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    debugPrint('REQUEST[${options.method}] => PATH: ${options.baseUrl+options.path}');
    debugPrint('REQUEST[${options.headers}]');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async{
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl+response.requestOptions.path}');
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.data}');
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.queryParameters}');
    super.onResponse(response, handler);
  }


  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    // Core core=Core();
    String errorMessage;
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = "${err.response?.statusCode} : ${err.response?.statusMessage}";
        debugPrint("errorMessage====1=${errorMessage}");
        break;
      case DioExceptionType.sendTimeout:
        errorMessage = "${err.response?.statusCode} : ${err.response?.statusMessage}";
        debugPrint("errorMessage====2=${errorMessage}");

        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = "${err.response?.statusCode} : ${err.response?.statusMessage}";
        debugPrint("errorMessage====3=${errorMessage}");
        break;
      case DioExceptionType.badCertificate:
        errorMessage = "${err.response?.statusCode} : ${err.response?.statusMessage}";
        debugPrint("errorMessage====4=${errorMessage}");
        break;
      case DioExceptionType.badResponse:
        // debugPrint("errorMessage====5=${err.response?.data['status']['message']}");
        errorMessage = "${err.response?.statusCode} : ${err.response?.statusMessage}";
        debugPrint("errorMessage====5=${errorMessage}");
      case DioExceptionType.cancel:
        errorMessage = "${err.response?.statusCode} : ${err.response?.statusMessage}";
        debugPrint("errorMessage====6=${errorMessage}");
        break;
      case DioExceptionType.connectionError:
        errorMessage = "${err.response?.statusCode} : ${err.response?.statusMessage}";
        debugPrint("errorMessage====7=${errorMessage}");
        break;
      default:
        errorMessage = 'Unknown error';
    }
    debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');


      return super.onError(err, handler);
  }




}