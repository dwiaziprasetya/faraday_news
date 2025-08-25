import 'package:faraday_news/constant/nav_ids.dart';
import 'package:faraday_news/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:get/instance_manager.dart';

class HomeNav extends StatelessWidget {
  const HomeNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        if (settings.name != '/home') {
          return GetPageRoute(settings: settings, page: () => HomeView());
        }
        return null;
      },
    );
  }
}
