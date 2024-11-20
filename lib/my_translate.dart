import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
      'hello': 'Hello',
      'dark_mode': 'Dark Mode',
      'share':'Share',
    },
    'vi_VN': {
      'hello': 'Xin chào',
      'dark_mode': 'Chế độ tối',
      'share':'Chia sẻ',    },
  };
}
