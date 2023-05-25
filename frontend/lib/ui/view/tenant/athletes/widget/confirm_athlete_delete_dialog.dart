import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmAthleteDeleteDialog extends StatelessWidget {

  final String athleteName;

  const ConfirmAthleteDeleteDialog({super.key, required this.athleteName});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text('Delete Athlete'),
      content: Text('Do you want to remove the athlete $athleteName permanently?', style: TextStyle(color: Colors.black),),
      actions: [
        TextButton(onPressed: () => Get.back<bool>(result: false), child: Text('No')),
        TextButton(onPressed: () => Get.back<bool>(result: true), child: Text('Yes'))
      ],
    );
  }

}