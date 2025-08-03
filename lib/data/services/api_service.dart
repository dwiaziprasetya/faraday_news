import 'package:dio/dio.dart';
import 'package:faraday_news/data/models/news_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: dotenv.env['BASE_URL']!,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final apiKey = dotenv.env['REPLACE_WITH_YOUR_API_KEY'];

  Future<NewsResponse> getEverything({required String query}) async {
    try {
      final response = await _dio.get(
        '/everything',
        queryParameters: {'q': query, 'apiKey': apiKey},
      );

      return NewsResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message'] ?? 'Failed to fetch news');
      } else {
        throw Exception('Network Error: ${e.message}');
      }
    }
  }

  Future<NewsResponse> getTopHeadlines({String country = 'us'}) async {
    try {
      final response = await _dio.get(
        '/top-headlines',
        queryParameters: {'country': country, 'apiKey': apiKey},
      );

      return NewsResponse.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message'] ?? 'Failed to fetch news');
      } else {
        throw Exception('Network Error: ${e.message}');
      }
    }
  }
}
