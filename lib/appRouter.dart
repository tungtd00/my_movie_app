import 'package:my_movie_app/view/homePage/homePage.dart';
import 'package:my_movie_app/view/homePage/homeBinding.dart';
import 'package:my_movie_app/view/movieDetail/widget/full_screen_widget.dart';
import 'package:my_movie_app/view/setting/setting_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_movie_app/view/splashPage/splashPage.dart';
import 'package:my_movie_app/view/splashPage/splashBinding.dart';
import 'package:my_movie_app/view/movieDetail/movieDetailPage.dart';
import 'package:my_movie_app/view/movieDetail/movieDetailBinding.dart';

class AppRouter {
  static const SPLASH_PAGE = "/splash";
  static const HOME_PAGE = "/home";
  static const CATEGORY_PAGE = "/category";
  static const CATEGORY_ITEM_PAGE = "/category_item";
  static const IMAGE_CONTINUE_PAGE = "/image_continue";
  static const MOVIE_DETAIL_PAGE = "/movie_detail_page";
  static const SET_LANGUAGE_PAGE = "/set_laguage";
  static const INTRO_PAGE = "/intro";
  static const SETTING_PAGE = "/setting_page";
  static const MOVIE_FULL_SCREEN = "/movie_full_screen";


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
      GetPage(
      name: AppRouter.MOVIE_DETAIL_PAGE,
      page: () => MovieDetailPage(), // Màn hình chi tiết phim
      binding: MovieDetailBinding(),   // Binding để khởi tạo controller với arguments
    ),


  ];
}
