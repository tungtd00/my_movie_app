class Movie {
  final int id;
  final String title;
  final String director;
  final int year;
  final String url;
  final String image;
  final String description;
  final List<String> types;

  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.year,
    required this.url,
    required this.image,
    required this.description,
    required this.types,
  });

  // Convert từ JSON thành Movie object
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      director: json['director'],
      year: json['year'],
      url: json['url'],
      image: json['image'],
      description: json['description'],
      types: List<String>.from(json['types']),
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
