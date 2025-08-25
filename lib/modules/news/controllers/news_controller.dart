import 'package:faraday_news/data/models/news_response.dart';
import 'package:faraday_news/data/repository/faraday_news_repository.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  final FaradayNewsRepository repository;

  NewsController({required this.repository});

  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var newsResponse = Rx<NewsResponse?>(null);

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      newsResponse.value = await repository.fetchEverything();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
