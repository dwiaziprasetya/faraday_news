import 'package:cached_network_image/cached_network_image.dart';
import 'package:faraday_news/controllers/home_controller.dart';
import 'package:faraday_news/data/repository/faraday_news_repository.dart';
import 'package:faraday_news/data/services/api_service.dart';
import 'package:faraday_news/widgets/news_article_item_loading.dart';
import 'package:faraday_news/widgets/news_article_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(
    HomeController(repository: FaradayNewsRepository(ApiService())),
  );

  @override
  void dispose() {
    Get.delete<HomeController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF09122C),
        body: Column(
          children: [
            Obx(() {
              final article = controller.randomArticle;

              if (article == null) {
                return Stack(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[500]!,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(color: Colors.grey[300]),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              const Color(0xFF09122C),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: article.urlToImage!,
                      width: double.infinity,
                      height: 400,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[500]!,
                        highlightColor: Colors.grey[300]!,
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(color: Colors.grey[300]),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              const Color(0xFF09122C),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Text(
                              article.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Text(
                                'Read more',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Headlines',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(fontSize: 14, color: Color(0xFF93da97)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return NewsArticleItemLoading();
                    },
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
                  padding: EdgeInsets.zero,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];

                    if (article.urlToImage == null ||
                        article.urlToImage!.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return GestureDetector(
                      onTap: () => Get.toNamed('/detail'),
                      child: NewsArticleItemWidget(
                        imageUrl: article.urlToImage!,
                        title: article.title,
                        subtitle: article.description,
                        timeAgo: article.source?.name ?? '',
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
