import 'package:faraday_news/widgets/news_article_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: const Color(0xFF09122C),
        body: Column(
          children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/sample_image.png',
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                  const Positioned(
                    left: 16,
                    bottom: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tesla will accept \nBitcoin as payment, \nElon Musk says.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
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
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TOP HEADLINES',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_drop_down_sharp, color: Color(0xFF93da97)),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return NewsArticleItemWidget(
                    imageUrl:
                        'https://www.blackxperience.com/assets/content/blackattitude/blackstyle/106434195-1595357993564-elon2.jpg',
                    title:
                        'Elon Musk is the worlds richest person. Is he giving his money away?',
                    subtitle:
                        'Elon Musk is the worlds richest person. Is he giving his money away? Elon Musk is the worlds richest person. Is he giving his money away?',
                    timeAgo: '4h ago',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
