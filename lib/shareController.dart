
import 'package:get/get.dart';

class ShareController extends GetxController {
  // var font = "".obs;
  // var base64Image = "".obs;
  // var getDataDone = false.obs;
  // RxList<Category> categories = <Category>[].obs;
  // var categoriItemName = "".obs;
  // RxList<CategoryItem> categoriItem = <CategoryItem>[].obs;
  // var isShowCamera = false;
  // RxString language = "en".obs;
  // RxBool isUsed = false.obs;
  // var demoText = "AR VR DRAW".obs;
  // List<String> fontNames = <String>[];
  // final captureKey = GlobalKey();
  //
  // Uint8List? capturedImage;
  RxInt star = 0.obs;

  void changedStar(int number) {
    star.value = number;
  }

}
