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
    