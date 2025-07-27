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
    );
  }
}
