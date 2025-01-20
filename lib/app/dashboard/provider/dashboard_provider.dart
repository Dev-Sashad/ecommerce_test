import 'package:ecommerce_test/utils/base_model.dart';

class DashboardProvider extends BaseModel {
  int _currentTabIndex = 0; // Defaults to chat tab

  int get currentTabIndex => _currentTabIndex;

  set currentTabIndex (int val) {
    _currentTabIndex = val;
    notifyListeners();
  }

  void resetTab() {
    _currentTabIndex = 0;
  }
}
