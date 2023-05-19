import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The Base class for api calls.
abstract class ProviderBase extends GetConnect {

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();


  }
}