import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:my_movie_app/view/movieDetail/movieDetailController.dart';


class MovieDetailScreen extends StatelessWidget {
 

  MovieDetailScreen();

  @override
  Widget build(BuildContext context) {
    // Lấy đối tượng Movie từ Get.arguments
    final Movie movie = Get.arguments as Movie;
    // Khởi tạo MovieDetailController và truyền thông tin movie
    final MovieDetailController controller = Get.put(MovieDetailController(movie));

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: PopScope(
          onPopInvokedWithResult: (didPop, result) {
              // Khi trở lại trang trước, thiết lập lại chế độ dọc
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        
          },

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: controller.youtubePlayerController,
                showVideoProgressIndicator: true,
                
              ),
            
              // Thông tin chi tiết của phim
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Director: ${movie.director}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Year: ${movie.year}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      movie.description,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Types:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 8.0,
                      children: movie.types.map((type) => Chip(label: Text(type))).toList(),
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

class _ControlsOverlay extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;

  const _ControlsOverlay({
    Key? key,
    required this.isPlaying,
    required this.onPlayPause,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPlayPause,
      child: Stack(
        children: <Widget>[
          if (!isPlaying)
            Center(
              child: Icon(
                Icons.play_arrow,
                size: 100.0,
                color: Colors.white,
              ),
            )
          else
            Center(
              child: Icon(
                Icons.pause,
                size: 100.0,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
