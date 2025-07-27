import 'package:faraday_news/data/models/news_response.dart';
import 'package:faraday_news/data/services/api_service.dart';

class RagdalionNewsRepository {
  final ApiService api;

  RagdalionNewsRepository(this.api);

  Future<NewsResponse> fetchTopHeadlines({String country = 'us'}) {
    return api.getTopHeadlines(country: country);
  }
}
