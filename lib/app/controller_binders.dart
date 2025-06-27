import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/contoller/main_bottom_controller.dart';
import 'package:ostad_ecommers_app/core/service/network/network_clint.dart';
import 'package:ostad_ecommers_app/features/auth/ui/controller/sing_up_controller.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomController());
    Get.put(NetworkClint(
        onUnAuthoriz: _onUnAuthorize, commonHaders: _commonHeader));
    Get.put(SingUpController());
  }

  void _onUnAuthorize() {}

  final Map<String, String> _commonHeader = {
    'content-type': 'application/json',
    'token': ''
  };
}
