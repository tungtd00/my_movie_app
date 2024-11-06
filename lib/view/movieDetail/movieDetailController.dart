import 'package:get/get.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailController extends GetxController {
 late YoutubePlayerController youtubePlayerController; // Video player cho YouTube
  var isPlaying = false.obs; // Theo dõi trạng thái phát video

  final Movie movie; // Thông tin phim

  MovieDetailController(this.movie);

  @override
  void onInit() {
    super.onInit();
    
    // Chuyển đổi URL YouTube thành video ID
    final videoId = YoutubePlayer.convertUrlToId(movie.url)??"";

    // Khởi tạo YouTube player controller
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true, // Tự động phát video khi khởi tạo
        mute: false, // Không tắt âm thanh
      ),
    );

    // Lắng nghe sự thay đổi trạng thái của video
    youtubePlayerController.addListener(() {
      isPlaying.value = youtubePlayerController.value.isPlaying;
    });
  }

  @override
  void onClose() {
    // Giải phóng tài nguyên khi controller bị đóng
    youtubePlayerController.dispose();
    super.onClose();
  }
}