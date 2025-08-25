import 'package:faraday_news/controllers/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            );
          }
          return TextStyle(color: Colors.grey.shade400);
        }),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: const Color(0xFF09122C),
        selectedIndex: BaseController.to.currentIndex.value,
        onDestinationSelected: (value) => BaseController.to.changeIndex(value),
        destinations: [
          NavigationDestination(
            selectedIcon: const Icon(Icons.home, color: Color(0xFF93da97)),
            icon: Icon(Icons.home_outlined, color: Colors.grey.shade400),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.newspaper_outlined, color: Colors.grey.shade400),
            label: 'News',
            selectedIcon: const Icon(Icons.newspaper, color: Color(0xFF93da97)),
          ),
        ],
      ),
    );
  }
}
