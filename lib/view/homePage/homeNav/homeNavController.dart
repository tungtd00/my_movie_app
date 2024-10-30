import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_movie_app/models/movie.dart';


class HomeNavController extends GetxController{
  var movies = <Movie>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // Chuyển đổi JSON thành danh sách đối tượng Movie
  List<dynamic> jsonList = jsonDecode(jsonData);

  // Chuyển đổi danh sách json thành List<Movie>
   movies.value = jsonList.map((json) => Movie.fromJson(json)).toList();

  }
  
String jsonData = '''
  [
    {
      "id": 1,
      "title": "Movie Fixed",
      "director": "Director B",
      "year": 2023,
      "url": "https://youtu.be/vIBLHlAVRlg?si=1oRP4Qo3XuXeDbDt",
      "image": "https://image.tmdb.org/t/p/w500/uUiIGztTrfDhPdAFJpr6m4UBMAd.jpg",
      "description": "A captivating superhero movie with intense action and humor.",
      "types": [
        "Phim Hành Động"
      ]
    },
    {
      "id": 2,
      "title": "Movie Thriller",
      "director": "Director A",
      "year": 2021,
      "url": "https://youtu.be/vIBLHlAVRlg?si=1oRP4Qo3XuXeDbDt",
      "image": "https://phimmoi.club/wp-content/uploads/2023/10/Loki.jpg",
      "description": "A psychological thriller that keeps you on the edge of your seat.",
      "types": [
        "Phim Bí Ẩn",
        "Phim Kinh Dị"
      ]
    },
    {
      "id": 3,
      "title": "Historical Drama",
      "director": "Director C",
      "year": 2019,
      "url": "https://www.youtube.com/watch?v=example3",
      "image": "https://image.tmdb.org/t/p/w185/e1HOt09BgYH5oZ8xfgi8TQiReYR.jpg",
      "description": "A powerful drama set in the backdrop of ancient times.",
      "types": [
        "Phim Cổ Trang"
      ]
    },
    {
      "id": 4,
      "title": "Romantic Comedy",
      "director": "Director D",
      "year": 2022,
      "url": "https://www.youtube.com/watch?v=example4",
      "image": "https://phimmoi.club/wp-content/uploads/2020/12/Sweet-Home-2.jpg",
      "description": "A light-hearted romantic comedy full of laughter and love.",
      "types": [
        "Phim Tâm Lý"
      ]
    },
    {
      "id": 5,
      "title": "Science Fiction",
      "director": "Director E",
      "year": 2018,
      "url": "https://www.youtube.com/watch?v=example5",
      "image": "https://phimmoi.club/wp-content/uploads/2020/12/Sweet-Home-2.jpg",
      "description": "A futuristic adventure into space with stunning visuals.",
      "types": [
        "Phim Viễn Tưởng"
      ]
    },
    {
      "id": 6,
      "title": "Mystery of the Lost",
      "director": "Director F",
      "year": 2020,
      "url": "https://www.youtube.com/watch?v=example6",
      "image": "https://phimmoi.club/wp-content/uploads/2020/12/Sweet-Home-2.jpg",
      "description": "A detective solving a mysterious disappearance in the city.",
      "types": [
        "Phim Bí Ẩn",
        "Phim Trinh Thám"
      ]
    },
    {
      "id": 7,
      "title": "Epic Adventure",
      "director": "Director G",
      "year": 2016,
      "url": "https://www.youtube.com/watch?v=example7",
      "image": "https://phimmoi.club/wp-content/uploads/2020/12/Sweet-Home-2.jpg",
      "description": "An epic journey across different worlds with magical creatures.",
      "types": [
        "Phim Phiêu Lưu"
      ]
    },
    {
      "id": 8,
      "title": "Action Packed",
      "director": "Director H",
      "year": 2023,
      "url": "https://www.youtube.com/watch?v=example8",
      "image": "https://phimmoi.club/wp-content/uploads/2020/12/Sweet-Home-2.jpg",
      "description": "Non-stop action from start to finish, with heart-pounding sequences.",
      "types": [
        "Phim Hành Động"
      ]
    },
    {
      "id": 9,
      "title": "Romantic Saga",
      "director": "Director I",
      "year": 2019,
      "url": "https://www.youtube.com/watch?v=example9",
      "image": "https://phimmoi.club/wp-content/uploads/2020/12/Sweet-Home-2.jpg",
      "description": "A sweeping romantic tale spanning across decades.",
      "types": [
        "Phim Lãng Mạn"
      ]
    },
    {
      "id": 10,
      "title": "Thriller in the Dark",
      "director": "Director J",
      "year": 2017,
      "url": "https://www.youtube.com/watch?v=example10",
      "image": "https://phimmoi.club/wp-content/uploads/2020/12/Sweet-Home-2.jpg",
      "description": "A dark thriller that delves deep into the human psyche.",
      "types": [
        "Phim Kinh Dị",
        "Phim Bí Ẩn"
      ]
    },
    {
      "id": 11,
      "title": "Fantasy Kingdom",
      "director": "Director K",
      "year": 2020,
      "url": "https://www.youtube.com/watch?v=example11",
      "image": "https://phimmoi.club/wp-content/uploads/2020/12/Sweet-Home-2.jpg",
      "description": "A fantasy world filled with mythical creatures and epic battles.",
      "types": [
        "Phim Kỳ Ảo"
      ]
    },
    {
      "id": 12,
      "title": "Comedy Delight",
      "director": "Director L",
      "year": 2021,
      "url": "https://www.youtube.com/watch?v=example12",
      "image": "https://phimmoi.club/wp-content/uploads/2020/12/Sweet-Home-2.jpg",
      "description": "A hilarious comedy that will keep you laughing until the end.",
      "types": [
        "Phim Hài"
      ]
    }
  ]
''';
}