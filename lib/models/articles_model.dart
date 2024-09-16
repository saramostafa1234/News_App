class ArticleModel {
  final String status;
  final List<Article> articles;

  ArticleModel({required this.status, required this.articles});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        status: json["status"],
        articles: List.from(json["articles"])
            .map(
              (data) => Article.fromJson(data),
            )
            .toList(),
      );
}

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;

  Article(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt});

  factory Article.fromJson(Map<String, dynamic> json) => Article(
      author: json["source"]["name"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"] ?? "",
      publishedAt: json["publishedAt"]);
}
