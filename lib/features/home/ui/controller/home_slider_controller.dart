import 'package:get/get.dart';
import 'package:ostad_ecommers_app/app/urls.dart';
import 'package:ostad_ecommers_app/core/service/network/network_clint.dart';
import 'package:ostad_ecommers_app/features/home/data/model/slider_model.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;

  String? _errorMessage;

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<SliderModel> _sliderModelList = [];

  List<SliderModel> get sliderModelList => _sliderModelList;

  Future<bool> getHomeSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkRespons response = await Get.find<NetworkClint>().getRequest(
      Urls.homeSliderUrl,
    );
    if (response.isSuccess) {
      List<SliderModel> list = [];
      for (Map<String, dynamic> slider in response.responsData!['data']
          ['results']) {
        list.add(SliderModel.fromJson(slider));
      }
      _sliderModelList = list;
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
