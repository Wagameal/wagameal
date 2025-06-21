import 'package:get/get.dart';
import 'app_routes.dart';
import '../modules/splash/splash_screen.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/onboarding/onboarding_screen.dart';
import '../modules/onboarding/onboarding_binding.dart';
import '../modules/login/login_screen.dart';
import '../modules/login/login_binding.dart';
import '../modules/dashboard/dashboard_screen.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/product_list/product_list_screen.dart';
import '../modules/product_list/product_list_binding.dart';
import '../modules/product_details/product_details_screen.dart';
import '../modules/product_details/product_details_binding.dart';
import '../modules/profile/profile_screen.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/my_profile/my_profile_screen.dart';
import '../modules/my_profile/my_profile_binding.dart';
import '../modules/pet_profile/pet_profile_screen.dart';
import '../modules/pet_profile/pet_profile_binding.dart';
import '../modules/about_us/about_us_screen.dart';
import '../modules/about_us/about_us_binding.dart';
import '../modules/faq/faq_screen.dart';
import '../modules/faq/faq_binding.dart';
import '../modules/all_messages/all_messages_screen.dart';
import '../modules/all_messages/all_messages_binding.dart';

class AppPages {

  static List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnBoardingScreen(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.product_list,
      page: () => ProductListScreen(),
      binding: ProductListBinding(),
    ),
    GetPage(
      name: AppRoutes.product_details,
      page: () => ProductDetailsScreen(),
      binding: ProductDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.my_profile,
      page: () => MyProfileScreen(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.pet_profile,
      page: () => PetProfileScreen(),
      binding: PetProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.about_us,
      page: () => AboutUsScreen(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: AppRoutes.faq,
      page: () => FaqScreen(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: AppRoutes.all_messages,
      page: () => AllMessagesScreen(),
      binding: AllMessagesBinding(),
    ),
  ];
}
