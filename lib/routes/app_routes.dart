// lib/routes/app_pages.dart
import 'package:faraday_news/features/base/base_view.dart';
import 'package:faraday_news/features/detail/detail_view.dart';
import 'package:faraday_news/routes/app_pages.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.base, page: () => BaseView()),
    GetPage(name: AppRoutes.detail, page: () => DetailView()),
  ];
}
