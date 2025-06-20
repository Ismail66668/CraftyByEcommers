import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainBottomController extends GetxController {
  int _curentIndex = 0;

  int get selectdeIndex => _curentIndex;

  void changeIndex(int index) {
    if (index == _curentIndex) {
      return;
    }
    _curentIndex = index;
    update();
  }

  void df() {}

  void backToHome() {
    if (_curentIndex != 0) {
      _curentIndex = 0;
      update();
    }
  }

  void moveToChange() {
    changeIndex(1);
    update();
  }
}
