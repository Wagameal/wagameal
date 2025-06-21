import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_images.dart';
import '../../network/network_controller.dart';
import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ConnectivityService connectivityService = Get.find<ConnectivityService>();
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: Obx(() {
          if (connectivityService.isConnected.value) {
            return   Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                AppImages.splashImage,
                fit: BoxFit.cover,
              ),
            );
          } else {
            return Scaffold(
              body: Text("")
              // NoInternetConnectivity(() {
              //   controller.onInit();
              //   Get.back();
              // },
              // ),
            );
          }
        }),

      ),
    );
  }
}

