import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:my_movie_app/comon/widget/movieItem.dart';
import 'package:my_movie_app/comon/widget/movie_slide.dart';
import 'package:my_movie_app/view/homePage/homeNav/homeNavController.dart';

class HomeNavPage extends GetWidget {
   final HomeNavController homeNavController = Get.put(HomeNavController());
  @override
  Widget build(BuildContext context) {
      return Container(
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
      );
  }

}