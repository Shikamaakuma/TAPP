import 'package:frontend/packages/gettools/statefull_getbuilder.dart';
import 'package:get/get.dart';

/// A stateful extenstion of a [GetxController]. Use in combination with [StatefulGetBuilder]
/// A controller can have the following states.
/// - success
/// - empty
/// - loading
/// - loadingMore
/// - error
///
/// The default state is loading.
///
///
abstract class StatefulGetxController extends GetxController {
  final success = false.obs;
  final empty = true.obs;
  final loading = true.obs;
  final loadingMore = false.obs;
  final error = false.obs;
  final errorMessage = Rxn<String>();

  /// Sets the state a success. Use [empty] to declares the data as empty.
  void setSuccess([bool empty = false]) {
    success.value = true;
    loading.value = false;
    loadingMore.value = false;
    this.empty.value = empty;
    error.value = false;
    errorMessage.value = null;
  }

  /// Set the state as an error.
  void setError(String errorMessage) {
    success.value = false;
    loading.value = false;
    loadingMore.value = false;
    error.value = true;
    this.errorMessage.value = errorMessage;
  }

  /// Set the state as loading
  void setLoading([bool loadingMore = false]) {
    if (loadingMore) {
      this.loadingMore.value = true;
    } else {
      loading.value = true;
      success.value = false;
    }
  }

}