import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The Base class for api calls.
abstract class ProviderBase extends GetConnect {

  @override
  @mustCallSuper
  void onInit() {
    super.onInit();

    /// Base url
    httpClient.baseUrl = 'https://localhost:8081/api/v1';

    /// Allow self singed certificates for local dev servers.
    allowAutoSignedCert = true;

    /// Extend timeout for local dev servers.
    httpClient.timeout = const Duration(seconds: 20);
  }
}