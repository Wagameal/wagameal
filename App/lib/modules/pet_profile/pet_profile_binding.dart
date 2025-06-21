import 'package:get/get.dart';
import 'pet_profile_controller.dart';
class PetProfileBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<PetProfileController>(() => PetProfileController());
  }
}
