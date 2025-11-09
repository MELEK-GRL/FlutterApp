class NewsModel {
  final String name;
  final String description;
  final String image;
  final String url;
  final String source;

  NewsModel({
    required this.name,
    required this.description,
    required this.image,
    required this.url,
    required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
      source: json['source'] ?? '',
    );
  }
}
