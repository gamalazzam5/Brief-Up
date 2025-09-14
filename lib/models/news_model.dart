class NewsModel {
  final String title;
  final String description;
  final String imageUrl;
  final String content;
  final String newsUrl;

  NewsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.content,
    required this.newsUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
      newsUrl: json['url'] ?? '',
    );
  }
}
