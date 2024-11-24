import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
      'dark_mode': 'Dark Mode',
      'share':'Share',
      "history_movie": "History Movie",
      "category": "Category",
      "search": "Search",
      "favourite": "Favourite",
      "profile": "Profile"
    },
    'vi_VN': {
      'hello': 'Xin chào',
      'dark_mode': 'Chế độ tối',
      'share':'Chia sẻ',
      "history_movie": "Phim Lịch Sử",
      "category": "Thể Loại",
      "search": "Tìm Kiếm",
      "favourite": "Yêu Thích",
      "profile": "Tài khoản"},
  };
}
