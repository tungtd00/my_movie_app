import 'package:get/get.dart';

class HomeController extends GetxController{
// Biến để theo dõi tab hiện tại
  var selectedIndex = 0.obs;

  // Hàm để chuyển tab
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}