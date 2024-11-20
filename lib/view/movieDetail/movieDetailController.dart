import 'package:get/get.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailController extends GetxController {

  var isPlaying = false.obs; // Theo dõi trạng thái phát video

  final Movie movie; // Thông tin phim
 late VideoPlayerController _controller;

  MovieDetailController(this.movie);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {


    super.onClose();
  }
}