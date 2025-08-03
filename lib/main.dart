import 'package:faraday_news/controllers/base_controller.dart';
import 'package:faraday_news/features/base/base_view.dart';
import 'package:faraday_news/features/detail/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  Get.put<BaseController>(BaseController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => BaseView()),
        GetPage(name: '/detail', page: () => DetailView()),
      ],
      debugShowCheckedModeBanner: false,
      home: const BaseView(),
    );
  }
}
