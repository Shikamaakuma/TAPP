import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomMenu extends StatelessWidget {
  final int selectedIndex;

  const BottomMenu({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.calendar_month),
          label: 'reservations'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.help_outline),
          label: 'help'.tr,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings),
          label: 'settings'.tr,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      backgroundColor: Colors.white,
      selectedFontSize: 12,
      iconSize: 24,
      onTap: (value) {
        if (value == 0 && value != selectedIndex) {
          Get.offAndToNamed('/');
        }
        if (value == 1 && value != selectedIndex) {
          Get.offNamedUntil('help', (route) => false);
          //Get.offAndToNamed('/help');
        }
        if (value == 2 && value != selectedIndex) {
          Get.offAndToNamed('/settings');
        }
      },
      elevation: 5,
    );
  }
}