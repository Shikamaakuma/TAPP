

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

enum ControllerState {
  loading,
  success,
  error,
  empty,
  loadingMore


}


abstract class StatefulGetxController extends GetxController {
  final success = false.obs;
  final empty = true.obs;
  final loading = true.obs;
  final loadingMore = false.obs;
  final error = false.obs;
  final state = ControllerState.loading.obs;
  final errorMessage = Rxn<String>();

  void setSuccess([bool empty = false]) {
    success.value = true;
    loading.value = false;
    loadingMore.value = false;
    this.empty.value = empty;
    error.value = false;
    errorMessage.value = null;
  }

  void setError(String errorMessage, {bool forceUpdate = false}) {
    success.value = false;
    loading.value = false;
    loadingMore.value = false;
    error.value = true;
    this.errorMessage.value = errorMessage;
  }

  void setLoading([bool loadingMore = false]) {
    if (loadingMore) {
      this.loadingMore.value = true;
    } else {
      loading.value = true;
      success.value = false;
    }
  }

}