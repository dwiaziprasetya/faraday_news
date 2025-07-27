import 'package:faraday_news/controllers/news_controller.dart';
import 'package:faraday_news/data/repository/faraday_news_repository.dart';
import 'package:faraday_news/data/services/api_service.dart';
import 'package:faraday_news/widgets/news_article_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final controller = Get.put(
    NewsController(repository: FaradayNewsRepository(ApiService())),
  );

  @override
  void dispose() {
    Get.delete<NewsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF09122C),
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', width: 40, height: 40),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Discover News',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF09122C),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return Center(
            child: Text(
              controller.errorMessage.value,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (controller.newsResponse.value == null ||
            controller.newsResponse.value!.articles.isEmpty) {
          return const Center(
            child: Text(
              'No news available',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final articles = controller.newsResponse.value!.articles;

        return ListView.builder(
          itemCount: articles.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return NewsArticleItemWidget(
              imageUrl: article.urlToImage!,
              title: article.title,
              subtitle: article.description,
              timeAgo: article.source!.name,
            );
          },
        );
      }),
    );
  }
}
