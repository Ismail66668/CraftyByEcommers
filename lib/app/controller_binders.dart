import 'package:get/get.dart';
import 'package:ostad_ecommers_app/common/contoller/auth_controller.dart';
import 'package:ostad_ecommers_app/common/contoller/catagory_list_controller.dart';
import 'package:ostad_ecommers_app/common/contoller/main_bottom_controller.dart';
import 'package:ostad_ecommers_app/core/service/network/network_clint.dart';
import 'package:ostad_ecommers_app/features/auth/loging_screen.dart';
import 'package:ostad_ecommers_app/features/auth/ui/controller/loging_controller.dart';
import 'package:ostad_ecommers_app/features/auth/ui/controller/sing_up_controller.dart';
import 'package:ostad_ecommers_app/features/auth/ui/controller/verify_otp_controller.dart';
import 'package:ostad_ecommers_app/features/home/ui/controller/home_slider_controller.dart';

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomController());
    Get.put(NetworkClint(
        onUnAuthoriz: _onUnAuthorize, commonHaders: _commonHeaders));
    Get.put(SignUpController());
    Get.put(VerifyOtpController());
    Get.put(AuthController());
    Get.put(LogingController());
    Get.put(HomeSliderController());
    Get.put(CatagoryListController());
  }

  void _onUnAuthorize() {
    Get.find<AuthController>().clearUserData();
    Get.to(const LogingScreen());
  }

  Map<String, String> get _commonHeaders {
    return {
      'content-type': 'application/json',
      'token': AuthController().accessToken ?? '',
    };
  }
}
