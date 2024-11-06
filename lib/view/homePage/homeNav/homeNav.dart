import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/appRouter.dart';
import 'package:my_movie_app/comon/widget/movieItem.dart';
import 'package:my_movie_app/comon/widget/movie_slide.dart';
import 'package:my_movie_app/view/homePage/homeNav/homeNavController.dart';

class HomeNavPage extends GetWidget {
   final HomeNavController homeNavController = Get.put(HomeNavController());
  @override
  Widget build(BuildContext context) {
      return Scaffold(
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
              ),
              
            ]),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Phim nổi bật",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 16,),
                MoviesSlider(movie: homeNavController.movies),
                Text("Phim mới",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 16,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...homeNavController.movies.map((e) =>
                      MovieItem(imageUrl: e.image, name: e.title, year: e.year, onTap: (){
                         Get.toNamed(AppRouter.MOVIE_DETAIL_PAGE, arguments: e);
                      })
                      ),
                  
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                Text("Phim truyền hình",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 16,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...homeNavController.movies.map((e) =>
                      MovieItem(imageUrl: e.image, name: e.title, year: e.year, onTap: (){
                        
                      })
                      ),
                  
                    ],
                  ),
                ),
            
              ],
            ),
          ),
        ),
      );
  }

}