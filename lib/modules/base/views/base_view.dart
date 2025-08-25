import 'package:faraday_news/controllers/base_controller.dart';
import 'package:faraday_news/navigation/home_nav.dart';
import 'package:faraday_news/navigation/news_nav.dart';
import 'package:faraday_news/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: BaseController.to.currentIndex.value,
          children: [HomeNav(), Newsnav()],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
