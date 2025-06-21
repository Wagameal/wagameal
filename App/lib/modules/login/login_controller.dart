import 'package:app/api/Server.dart';
import 'package:app/modules/login/wrappers/PayloadLogin.dart';
import 'package:app/modules/login/wrappers/RequestLogin.dart';
import 'package:app/modules/login/wrappers/ResponseLogin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_strings.dart';
import '../../widgets/custom_toast_notification.dart';

class LoginController extends GetxController {

  Server server = Server();
  PayloadLogin? payloadLogin;

  @override
  void onInit() {
    super.onInit();
    userLogin();
  }

  void userLogin() async {
    try {
      RequestLogin requestLogin = RequestLogin();
      requestLogin.mobile = "9156327926";

      ResponseLogin response = await server.userLogin(requestLogin);
      if (response.success == true) {

        update();
      } else {
        // CustomToastNotification.display('${response.status?.message}',NotificationType.error);
        // isLoginButtonLoading.value = false;
        update();
      }
    } catch (e) {
      if(e is DioError && e.response != null) {
        debugPrint("response data=====${e.response?.data['status']}");
        // CustomToastNotification.display('${e.response?.data['status']['message']}',NotificationType.error);
        if(e.response?.data['responseCode'] != AppStrings.errorCodeUnauthorisedUser){
          CustomToastNotification.display('${e.response?.data['status']['message']}',NotificationType.error);
        }
        if(e.response?.data['responseCode'] == 500){
          // DialogUtils.showServerDownSheet(onRetry: () {
          //   onInit();
          //   Get.back();// or any retry logic
          // });
        }
      } else {
        debugPrint('$e');
      }
      // isLoginButtonLoading.value = false;
      update();
    }
  }

  void userLoginVerify() async {
    try {
      RequestLogin requestLogin = RequestLogin();
      requestLogin.mobile = "9156327926";
      requestLogin.otp = "2221";

      ResponseLogin response = await server.userLoginVerify(requestLogin);
      if (response.success == true) {
        debugPrint("======");
        payloadLogin = PayloadLogin.fromJson(response.data);
        update();
        debugPrint("======${payloadLogin?.user?.name}");

      } else {
        // CustomToastNotification.display('${response.status?.message}',NotificationType.error);
        // isLoginButtonLoading.value = false;
        update();
      }
    } catch (e) {
      if(e is DioError && e.response != null) {
        debugPrint("response data=====${e.response?.statusCode.toString()}");
        debugPrint("response data=====${e.response?.toString()}");
        debugPrint("response data=====${e.response?.data['message']?.toString()}");
        if(e.response?.statusCode == AppStrings.errorInternalServerError){
          CustomToastNotification.display('${e.response?.data['message']?.toString()}',NotificationType.error);
        }
      } else {
        debugPrint('$e');
      }
      // isLoginButtonLoading.value = false;
      update();
    }
  }



}
