import 'package:app/modules/login/login_binding.dart';
import 'package:app/modules/login/login_screen.dart';
import 'package:get/get.dart';

import '../onboarding/onboarding_binding.dart';
import '../onboarding/onboarding_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }
  void startTimer() {
    // PreferenceUtils.init();
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offAll(const OnBoardingScreen(), binding: OnBoardingBinding());
      // Get.offAll(const LoginScreen(), binding: LoginBinding());
      // PreferenceUtils.init();
      // debugPrint("value==1=${PreferenceUtils.getString("knoopay_device_info_ip_address").toString()}");
      //
      // if(PreferenceUtils.getString("knoopay_device_info_ip_address") != "" && PreferenceUtils.getString("knoopay_device_info_ip_address") != null
      //     && PreferenceUtils.getString("knoopay_device_info_ip_address") != "null"){
      //   getUserByToken();
      // }else {
      //   apiLoading.value = true;
      //   update();
      //   DeviceInfoManagerInfo value = await DeviceInfoManager.getDeviceDetails();
      //   debugPrint("value==1=${value.device_id.toString()}");
      //   debugPrint("value==2=${value.operating_system.toString()}");
      //   debugPrint("value==3=${value.uuid.toString()}");
      //   debugPrint("value==4=${value.screen_resolution.toString()}");
      //   debugPrint("value==5=${value.ip_address.toString()}");
      //   await PreferenceUtils.setString("knoopay_device_info_device_id",value.device_id.toString());
      //   await PreferenceUtils.setString("knoopay_device_info_operating_system",value.operating_system.toString());
      //   await PreferenceUtils.setString("knoopay_device_info_uuid",value.uuid.toString());
      //   await PreferenceUtils.setString("knoopay_device_info_screen_resolution",value.screen_resolution.toString());
      //   await PreferenceUtils.setString("knoopay_device_info_ip_address",value.ip_address.toString());
      //   debugPrint("value===${value.toString()}");
      //   getUserByToken();
      // }

    });
  }


}
