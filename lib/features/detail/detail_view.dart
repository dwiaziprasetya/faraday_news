import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

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
                        Text(
                          'Trending · 1h ago',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
