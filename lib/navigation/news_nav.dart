import 'package:faraday_news/constant/nav_ids.dart';
import 'package:faraday_news/features/news/news_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Newsnav extends StatelessWidget {
  const Newsnav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.news),
      onGenerateRoute: (settings) {
        if (settings.name != '/news') {
          return GetPageRoute(settings: settings, page: () => NewsView());
        }
        return null;
      },
    );
  }
}
