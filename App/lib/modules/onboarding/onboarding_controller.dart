import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../../theme/app_images.dart';

class OnBoardingController extends GetxController {

  int currentIndex = 0;
  int? totalIndex;
  final CarouselSliderController carouselController =  CarouselSliderController();


  List<String> onBoardingModel=[
    AppImages.onboardOne,
    AppImages.onboardTwo,
    AppImages.onboardThree,
  ];

  @override
  void onInit() {
    super.onInit();
  }

}
