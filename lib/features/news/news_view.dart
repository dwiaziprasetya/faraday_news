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
                'https://akcdn.detik.net.id/community/media/visual/2025/01/10/cristiano-ronaldo-2_169.jpeg?w=650',
            title: 'Is This the Future of Face Masks?',
            subtitle: 'Vanessa Friedman',
            timeAgo: '4h ago',
          );
        },
      ),
    );
  }
}
