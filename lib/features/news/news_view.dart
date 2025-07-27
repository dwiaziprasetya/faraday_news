import 'package:faraday_news/widgets/news_article_item_widget.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF09122C),
      appBar: AppBar(
        title: Text('News', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF09122C),
      ),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          return NewsArticleItemWidget(
            imageUrl:
                'https://emberhurst.com/cdn/shop/products/COMM1-SBPIC2_x606@2x.jpg?v=1666940194',
            title: 'Is This the Future of Face Masks?',
            subtitle: 'Vanessa Friedman',
            timeAgo: '4h ago',
          );
        },
      ),
    );
  }
}
