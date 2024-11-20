import 'package:get/get.dart';

class ChatController extends GetxController {
  // Danh sách tin nhắn (dùng RxList để tự động cập nhật UI)
  var messages = <String>[].obs;

  // Thêm tin nhắn mới
  void sendMessage(String message) {
    if (message.trim().isNotEmpty) {
      messages.add(message);
    }
  }
}
