import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie.dart';
import 'package:my_movie_app/view/movieDetail/widget/full_screen_widget.dart';
import 'package:video_player/video_player.dart';

class MovieDetailPage extends StatefulWidget {

  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late VideoPlayerController _controller;
  bool _isFullScreen = false;
  bool _showControls = true;
  Timer? _hideControlsTimer;
  final Movie movie = Get.arguments as Movie;
  bool isStart = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(movie.url),
    )
      ..initialize().then((_) {
        setState(() {});
        isStart = true;
        // _controller.play();
      });
    _startHideControlsTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  void _startHideControlsTimer() {
    _hideControlsTimer?.cancel();
    _hideControlsTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _showControls = false;
      });
    });
  }
  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });

    if (_isFullScreen) {
      Get.to(FullScreenVideoPlayer(controller: _controller));
    } else {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    }
  }
  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
    if (_showControls) {
      _startHideControlsTimer();
    }
  }


  Widget _buildControls() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Thanh tiến trình
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
          colors: const VideoProgressColors(
            playedColor: Colors.red,
            bufferedColor: Colors.grey,
            backgroundColor: Colors.black26,
          ),
        ),
        // Nút điều khiển
        Stack(
          alignment: Alignment.centerRight,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  onPressed: () {
                    final newPosition =
                        _controller.value.position - const Duration(seconds: 10);
                    _controller.seekTo(newPosition > Duration.zero
                        ? newPosition
                        : Duration.zero);
                  },
                ),
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  onPressed: () {
                    final newPosition = _controller.value.position +
                        const Duration(seconds: 10);
                    if (newPosition < _controller.value.duration) {
                      _controller.seekTo(newPosition);
                    }
                  },
                ),
              ],
            ),
            IconButton(
              icon: const Icon(Icons.fullscreen),
              onPressed: (){
                _toggleFullScreen();
    },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        leading: const BackButton(),
      ),
      body: GestureDetector(
        onTap: _toggleControls,
        child:!isStart? const Center(child: CircularProgressIndicator(),): Column(
          children: [
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Visibility(visible:_showControls,
                        child: _buildControls()),
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Director: ${movie.director}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Year: ${movie.year}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        movie.description,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Types:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      movie.types != null
                          ? Wrap(
                        spacing: 8.0,
                        children:movie.types!
                            .map((type) => Chip(label: Text(type)))
                            .toList(),
                      )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

