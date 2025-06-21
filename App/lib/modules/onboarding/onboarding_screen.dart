import 'package:app/theme/theme_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../theme/app_colours.dart';
import '../../network/network_controller.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/custom_button.dart';
import '../login/login_binding.dart';
import '../login/login_screen.dart';
import 'onboarding_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingState createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoardingScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final ConnectivityService connectivityService = Get.find<ConnectivityService>();
    return GetBuilder<OnBoardingController>(
      builder: (controller) =>
          Obx(() {
            if (connectivityService.isConnected.value) {
              return Scaffold(
                body: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Container(
                        child: CarouselSlider(
                          options: CarouselOptions(
                            height: MediaQuery.of(context).size.height,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 2 / 1,
                            autoPlayCurve: Curves.linear,
                            enableInfiniteScroll: false,
                            reverse: false,
                            pauseAutoPlayInFiniteScroll: true,
                            autoPlayInterval:const Duration(seconds: 4),
                            autoPlayAnimationDuration:const Duration(milliseconds: 300),
                            viewportFraction: 1,
                            onPageChanged: (index, reason) {
                              controller.currentIndex = index;
                              setState((){});
                              controller.totalIndex=controller.onBoardingModel.length;
                            },
                          ),


                          carouselController: controller.carouselController,
                          items: controller.onBoardingModel.map((onBoardingModel) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Stack(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Image.asset(
                                      onBoardingModel,
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height,
                                      fit: BoxFit.cover,
                                    ),
                                    // Row(
                                    //   crossAxisAlignment: CrossAxisAlignment.center,
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     if(controller.currentIndex!=2)
                                    //       Padding(
                                    //         padding: const EdgeInsets.only(top: 30,right: 30),
                                    //         child: InkWell(
                                    //             onTap: () async {
                                    //               // PreferenceUtils.init();
                                    //               // PreferenceUtils.setBool("is_onBoarding", true);
                                    //               // await controller.deviceDetails.getData().then((value) async {
                                    //               //   debugPrint("value===${value.toString()}");
                                    //                 Get.offAll(const LoginScreen(), binding: LoginBinding());
                                    //               // }).catchError((error, stackTrace) {
                                    //               //   Get.offAll(const LoginScreen(), binding: LoginBinding(),arguments: [true,'BS']);
                                    //               // });
                                    //             },
                                    //             child: Text(
                                    //               "Skip",
                                    //               textAlign: TextAlign.center,
                                    //               style: AppTextStyles.regular(
                                    //                   color: context.textNeutralColor,
                                    //                   size: 16
                                    //               ),
                                    //             )
                                    //
                                    //         ),
                                    //       ),
                                    //   ],
                                    // ),

                                    if(controller.currentIndex!=2)
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: SizedBox(
                                          height: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15,right: 15),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: controller.onBoardingModel.asMap().entries.map((entry) {
                                                return GestureDetector(
                                                  onTap: () => controller.carouselController.animateToPage(entry.key),
                                                  child: Container(
                                                    width: controller.currentIndex ==entry.key ? 18 :14,
                                                    height:controller.currentIndex ==entry.key ? 18 :14,
                                                    alignment: Alignment.center,
                                                    margin: const EdgeInsets.symmetric(
                                                        vertical: 8.0, horizontal: 4.0),
                                                    decoration:  BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: controller.currentIndex ==entry.key ? AppColours.primaryColorWM : Colors.grey,

                                                    ),

                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ),
                                      ),

                                    if(controller.currentIndex==2)
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 90,
                                          color: Colors.transparent,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: CustomButton(
                                                onPressed: () async {
                                                  Get.offAll(const LoginScreen(), binding: LoginBinding());
                                                },
                                                buttonTextValue: "Get Started",
                                                isButtonDisable: false
                                            ),
                                          ),
                                        ),
                                      ),

                                  ],
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),

                    ],
                  ),
                ),

              );
            } else {
              return const Scaffold(
                body: Text("")
                // NoInternetConnectivity(() {
                //   controller.onInit();
                //   Get.back();
                // },
                // ),
              );
            }
          }),

    );
  }
}

