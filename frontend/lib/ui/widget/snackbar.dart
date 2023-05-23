
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void _showSnackBar(String title,
    String body,
    Color textColor,
    Color backgroundColor,) {
  Get.snackbar(
    title,
    body,
    colorText: textColor,
    backgroundColor: backgroundColor,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 5),
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
    snackStyle: SnackStyle.GROUNDED,
    margin: const EdgeInsets.all(0),
  );
}

void showErrorSnackBar(String title, String body) {
  _showSnackBar(title, body, Colors.white, Colors.red);
}

void showSuccessSnackBar(String title, String body) {
  _showSnackBar(title, body, Colors.white, Colors.green);
}