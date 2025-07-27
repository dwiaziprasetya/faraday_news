import 'package:faraday_news/data/models/news_source.dart';

class NewsArticle {
  final String? author;
  final String title;
  final String description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final NewsSource? source;

  NewsArticle({
    required this.title,
    required this.description,
    this.author,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.source,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      author: json['author'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      source: json['source'] != null
          ? NewsSource.fromJson(json['source'])
          : null,
    );
  }
}
