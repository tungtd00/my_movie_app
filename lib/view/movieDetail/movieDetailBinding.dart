import 'package:get/get.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:my_movie_app/view/movieDetail/movieDetailController.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    // Lấy argument từ Get.arguments (là đối tượng Movie)
    Movie movie = Get.arguments as Movie;
    Get.lazyPut(() => MovieDetailController(movie));
  }
}
  