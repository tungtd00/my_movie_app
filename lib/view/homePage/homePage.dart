import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/view/homePage/homeController.dart';
import 'package:my_movie_app/view/homePage/homeNav/homeNav.dart';

class HomePage extends GetWidget{

   final HomeController homeController = Get.put(HomeController());

  // Danh sách các trang của bạn
  final List<Widget> pages = [
    HomeNavPage(),
    const Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "PTIT MOVIE",
              style: TextStyle(
                color: Color(0xFF2970E4),
                fontFamily: "ComicSansMS",
                fontSize: 22,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Get.toNamed(
                    AppRouter.SETTING_PAGE,
                  );
                },
                child: SvgPicture.asset(
                  "assets/svg/settings.svg",
                  height: 28,
                ),
              ),
              const SizedBox(
                width: 12,
              )
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
              label: 'Search',
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
    