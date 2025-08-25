import 'package:faraday_news/data/models/news_article.dart';
import 'package:faraday_news/data/models/news_response.dart';
import 'package:faraday_news/data/repository/faraday_news_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final FaradayNewsRepository repository;

  HomeController({required this.repository});

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var newsResponse = Rx<NewsResponse?>(null);

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  NewsArticle? _selectedArticle;

  NewsArticle? get randomArticle {
    if (_selectedArticle != null) return _selectedArticle;

    final articles = newsResponse.value?.articles ?? [];

    final validArticles = articles
        .where(
          (article) =>
              article.urlToImage != null &&
              article.urlToImage!.isNotEmpty &&
              article.title.isNotEmpty,
        )
        .toList();

    if (validArticles.isEmpty) return null;

    validArticles.shuffle();
    _selectedArticle = validArticles.first;
    return _selectedArticle;
  }

  void fetchNews() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      _selectedArticle = null;
      newsResponse.value = await repository.fetchTopHeadlines();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
