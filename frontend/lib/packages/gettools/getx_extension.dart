import 'package:get/get.dart';

typedef ItemCreator<S> = S Function();

/// Contains custom extension for the get package
extension GetxExtension on GetInterface {

  /// Finds the registered type <[T]> (or [tag]) or registers it.
  ///
  /// In case no type is found, the type created by [creator] will be registered.
  ///
  /// ```dart
  /// Get.find<Controller>(() => Controller())
  /// ```
  ///
  /// See [GetInstance.find] and [GetInstance.put] for more information.
  T findOrPut<T>(ItemCreator<T> creator, {String? tag}) {
    try {
      return GetInstance().find<T>(tag: tag);
    } catch (e) {
      T item = creator();
      GetInstance().put(item, tag: tag);
      return item;
    }
  }
}