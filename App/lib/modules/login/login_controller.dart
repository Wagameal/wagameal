import 'package:app/api/Server.dart';
import 'package:app/modules/login/wrappers/Banners.dart';
import 'package:app/modules/login/wrappers/PayloadLogin.dart';
import 'package:app/modules/login/wrappers/RequestLogin.dart';
import 'package:app/modules/login/wrappers/ResponseLogin.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/SharedPrefrenceSessionManager.dart';
import '../../theme/app_strings.dart';
import '../../widgets/custom_toast_notification.dart';

class LoginController extends GetxController {

  Server server = Server();
  PayloadLogin? payloadLogin;

  //Banner
  int currentIndexBanner = 0;
  int? totalIndexVoucher;
  final CarouselSliderController carouselControllerBanner =  CarouselSliderController();
  List<Banners> bannerList=[];


  @override
  void onInit() {
    super.onInit();
    getBannerList();
  }

  void sentOtp() async {
    try {
      RequestLogin requestLogin = RequestLogin();
      requestLogin.mobile = "9156327926";

      ResponseLogin response = await server.sentOtp(requestLogin);
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

  void resendOtp() async {
    try {
      RequestLogin requestLogin = RequestLogin();
      requestLogin.mobile = "9156327926";

      ResponseLogin response = await server.resendOtp(requestLogin);
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
      requestLogin.otp = "3429";

      ResponseLogin response = await server.userLoginVerify(requestLogin);
      if (response.success == true) {
        debugPrint("======");
        payloadLogin = PayloadLogin.fromJson(response.data);
        update();
        PreferenceUtils.init();
        await PreferenceUtils.setString("wagameal_app_token","${payloadLogin?.token}");
        debugPrint("======${payloadLogin?.user?.name}");
        getMeal();
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

  void getMeal() async {
    try {
      ResponseLogin response = await server.getMeal();
      if (response.success == true) {
        debugPrint("======");
        // payloadLogin = PayloadLogin.fromJson(response.data);
        update();
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

  void getBannerList() async {
    try {
      ResponseLogin response = await server.getBannerList();
      if (response.success == true) {
        debugPrint("======");
        // payloadLogin = PayloadLogin.fromJson(response.data);
        update();
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
