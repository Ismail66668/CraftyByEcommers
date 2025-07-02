import 'package:get/get.dart';
import 'package:ostad_ecommers_app/app/urls.dart';
import 'package:ostad_ecommers_app/common/contoller/auth_controller.dart';
import 'package:ostad_ecommers_app/common/model/user_model.dart';
import 'package:ostad_ecommers_app/core/service/network/network_clint.dart';
import 'package:ostad_ecommers_app/features/auth/data/model/login_request_model.dart';

class LogingController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  Future<bool> loging(LogingRequestModel model) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkRespons response = await Get.find<NetworkClint>()
        .postRequest(Urls.loginUrl, body: model.toJson());
    if (response.isSuccess) {
      await Get.find<AuthController>().saveData(
          UserModel.fromJson(response.responsData!['data']['user']),
          response.responsData!['data']['token']);

      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage!;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
