import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF09122C),
      body: Center(
        child: Text('Home Screen', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
