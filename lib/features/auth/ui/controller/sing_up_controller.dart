import 'package:get/get.dart';
import 'package:ostad_ecommers_app/app/urls.dart';
import 'package:ostad_ecommers_app/core/service/network/network_clint.dart';
import 'package:ostad_ecommers_app/features/auth/data/model/singup_request_model.dart';

class SingUpController extends GetxController {
  // lodeing State
  bool _lodingProgress = false;
  // error State
  String? _errorMasage;

  late String _massage;

  bool get lodingProggress => _lodingProgress;
  String? get errorMassage => _errorMasage;
  String get massage => _massage;

  // Atule  data

  Future<void> singup(SingupRequestModel model) async {
    // ignore: unused_local_variable
    bool isSuccess = false;
    _lodingProgress = true;
    update();
    final NetworkRespons respons = await Get.find<NetworkClint>()
        .postRequest(Urls.signUpUrl, body: model.toJson());
    if (respons.isSuccess) {
      //
      _massage = respons.responsData!['msg'];
      isSuccess = true;
      _errorMasage = null;
    } else {
      //
      _errorMasage = respons.errorMassage!;
      _lodingProgress = false;
      update();
    }
  }
}
