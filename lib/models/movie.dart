class Movie {
  final int id;
  final String title;
  final String director;
  final int? year;
  final String url;
  final String image;
  final String description;
  final List<String>? types;

  Movie({
    required this.id,
    required this.title,
    required this.director,
     this.year,
    required this.url,
    required this.image,
    required this.description,
     this.types = const [],
  });

  String convertGoogleDriveUrl() {
    final uri = Uri.parse(this.url);

    // Kiểm tra nếu URL chứa đoạn `/file/d/`
    if (uri.path.contains('/file/d/')) {
      final parts = uri.path.split('/'); // Tách các phần của đường dẫn
      final idIndex = parts.indexOf('d') + 1; // Lấy chỉ số của 'd' rồi +1 để tìm ID
      if (idIndex < parts.length) {
        final id = parts[idIndex];
        // Trả về URL theo format `uc?export=download&id=`
        return 'https://drive.google.com/uc?export=view&id=$id';
      }
    }

    // Nếu không phải định dạng hợp lệ, trả về chính URL ban đầu
    return url;
  }


  // Convert từ JSON thành Movie object
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      director: json['director'] as String,
      year: json['year'] as int?, // Có thể null
      url: json['url'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      types: (json['types'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList() ??
          [], // Mặc định là danh sách rỗng nếu null
    );
  }

  // Convert từ Movie object thành JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'director': director,
      'year': year,
      'url': url,
      'image': image,
      'description': description,
      'types': types,
    };
  }
}
