// lib/routes/app_pages.dart
import 'package:faraday_news/modules/base/views/base_view.dart';
import 'package:faraday_news/modules/detail/views/detail_view.dart';
import 'package:faraday_news/routes/app_pages.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.base, page: () => BaseView()),
    GetPage(name: AppRoutes.detail, page: () => DetailView()),
  ];
}
