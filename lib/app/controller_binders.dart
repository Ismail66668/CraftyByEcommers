import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/contoller/main_bottom_controller.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomController());
  }
}
