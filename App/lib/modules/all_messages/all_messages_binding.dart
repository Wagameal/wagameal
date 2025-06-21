import 'package:get/get.dart';
import 'all_messages_controller.dart';
class AllMessagesBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<AllMessagesController>(() => AllMessagesController());
  }
}
