import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/view/searchPage/searchPage.dart';
import 'package:my_movie_app/view/homePage/homeController.dart';
import 'package:my_movie_app/view/homePage/homeNav/homeNav.dart';

class HomePage extends GetWidget{

   final HomeController homeController = Get.put(HomeController());

  // Danh sách các trang của bạn
  final List<Widget> pages = [
    HomeNavPage(),

    Searchpage(),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
          title: const Text(
            "PTIT MOVIE",
            style: TextStyle(
              // color: Color(0xFF2970E4),
              fontFamily: "ComicSansMS",
              fontSize: 22,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.language),
              onPressed: () {
                // Chuyển đổi ngôn ngữ
                var locale = Get.locale == const Locale('en', 'US')
                    ? const Locale('vi', 'VN')
                    : const Locale('en', 'US');
                Get.updateLocale(locale);
              },
            ),
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                // Chuyển đổi chế độ sáng/tối
                Get.isDarkMode
                    ? Get.changeThemeMode(ThemeMode.light)
                    : Get.changeThemeMode(ThemeMode.dark);
              },
            ),
            // InkWell(
            //   onTap: () {
            //     Get.toNamed(
            //       AppRouter.SETTING_PAGE,
            //     );
            //   },
            //   child: SvgPicture.asset(
            //     "assets/svg/settings.svg",
            //     height: 22,
            //   ),
            // ),
            const SizedBox(
              width: 12,
            ),

          ]),
      
        body: Obx(() => pages[homeController.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: homeController.selectedIndex.value,
          onTap: homeController.changeTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
  
}
    