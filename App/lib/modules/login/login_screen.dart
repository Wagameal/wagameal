import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    // height: MediaQuery.of(context).size.height *0.15,
                    enlargeCenterPage: false,
                    autoPlay: true,
                    aspectRatio: 2 / 1,
                    autoPlayCurve: Curves.linear,
                    enableInfiniteScroll: true,
                    reverse: false,
                    pauseAutoPlayInFiniteScroll: true,
                    autoPlayInterval:const Duration(seconds: 4),
                    autoPlayAnimationDuration:const Duration(milliseconds: 1000),
                    viewportFraction: 0.85,
                    padEnds: false,
                    onPageChanged: (index, reason) {
                      controller.currentIndexBanner = index;
                      setState((){});
                      // controller.totalIndexVoucher=controller.onBoardingModel.length;
                    },
                  ),

                  carouselController: controller.carouselControllerBanner,
                  items: controller.bannerList.map((bannerListModel) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 12),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                              child: Image.network(
                                bannerListModel.imageLink ?? "",
                                // height: MediaQuery.of(context).size.height *0.20,
                                width: MediaQuery.of(context).size.width*0.85,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    controller.sentOtp();
                  },
                  child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.red,
                      child: Center(child: Text("Send OTP"))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    controller.resendOtp();
                  },
                  child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.red,
                      child: Center(child: Text("Resend OTP"))),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    controller.userLoginVerify();
                  },
                  child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.red,
                      child: Center(child: Text("Verify OTP"))),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: (){
                    controller.getMeal();
                  },
                  child: Container(
                      width: 100,
                      height: 50,
                      color: Colors.red,
                      child: Center(child: Text("Get Meal"))),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
