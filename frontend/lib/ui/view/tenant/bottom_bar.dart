import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomMenu extends StatelessWidget {
  final int selectedIndex;
  final int selectedTenantId;

  const BottomMenu({super.key, required this.selectedIndex, required this.selectedTenantId});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.sports),
          label: 'Tenant',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Athletes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.lightbulb),
          label: 'Skills',
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
          Get.offNamed('/tenant/$selectedTenantId');
        }
        if (value == 1 && value != selectedIndex) {
          Get.offNamed('/tenant/$selectedTenantId/athletes');
          //Get.offAndToNamed('/help');
        }
        if (value == 2 && value != selectedIndex) {
          Get.offNamed('/tenant/$selectedTenantId/skills');
        }
      },
      elevation: 5,
    );
  }
}