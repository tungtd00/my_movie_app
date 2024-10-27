import 'package:my_movie_app/view/homePage/homePage.dart';
import 'package:my_movie_app/view/homePage/homeBinding.dart';
import 'package:my_movie_app/view/setting/setting_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_movie_app/view/splashPage/splashPage.dart';
import 'package:my_movie_app/view/splashPage/splashBinding.dart';


class AppRouter {
  static const SPLASH_PAGE = "/splash";
  static const HOME_PAGE = "/home";
  static const CATEGORY_PAGE = "/category";
  static const CATEGORY_ITEM_PAGE = "/category_item";
  static const IMAGE_CONTINUE_PAGE = "/image_continue";
  static const DETAIL_PAGE = "/detail";
  static const TUTORIAL_SKETCH_PAGE = "/tutorial_sketch";
  static const TUTORIAL_TRACE_PAGE = "/tutorial_trace";
  static const SET_LANGUAGE_PAGE = "/set_laguage";
  static const INTRO_PAGE = "/intro";
  static const PERMISSON_PAGE = "/permission";
  static const PERMISSON_CAMERA_PAGE = "/permission_camera";
  static const PERMISSON_STORAGE_PAGE = "/permission_storage";
  static const MY_CREATION_PAGE = "/my_creation";
  static const SETTING_PAGE = "/setting_page";
  static const MAKE_TEXT = "/make_text_page";

  static List<GetPage<dynamic>> listGetPage = [
    GetPage(
        name: AppRouter.SPLASH_PAGE,
        page: () => Splash(),
        binding: SplashBinding()),
    GetPage(
        name: AppRouter.HOME_PAGE,
        page: () => HomePage(),
        binding: HomeBinding()),
    // GetPage(
    //     name: AppRouter.INTRO_PAGE,
    //     page: () => IntroPage(),
    //     binding: IntroBinding()),
    //
    GetPage(
      name: AppRouter.SETTING_PAGE,
      page: () => SettingPage(),
    ),

  ];
}
