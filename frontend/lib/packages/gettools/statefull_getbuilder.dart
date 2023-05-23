

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'stateful_controller.dart';

class StatefulGetBuilder<T extends StatefulGetxController> extends StatefulWidget {

  final Widget Function(T  controller) success;
  final Widget Function(T controller)? loading;
  final Widget Function(T controller)? error;
  final Widget Function(T controller)? empty;
  
  final T? init;
  final String? tag;
  final void Function(StatefulGetBuilderState<T> state)? initState;

  const StatefulGetBuilder({
    super.key, 
    required this.success, 
    this.loading, 
    this.error, 
    this.init, this.tag, this.initState, this.empty});

  @override
  StatefulGetBuilderState<T> createState() => StatefulGetBuilderState<T>();
}


class StatefulGetBuilderState<T extends StatefulGetxController> extends State<StatefulGetBuilder<T>> {

  T? controller;
  bool _isCreator = false;
  
  @override
  void initState() {
    super.initState();
    
    bool isRegistered = GetInstance().isRegistered<T>(tag: widget.tag);

    if (isRegistered) {
      if (GetInstance().isPrepared<T>(tag: widget.tag)) {
        _isCreator = true;
      } else {
        _isCreator = false;
      }
      controller = GetInstance().find<T>(tag: widget.tag);
    } else {
      controller = widget.init;
      _isCreator = true;
      GetInstance().put<T>(controller!, tag: widget.tag);
    }
    widget.initState?.call(this);
  }
  
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller!.loading.isTrue && widget.loading != null) {
        return widget.loading!(controller!);
      } else if (widget.error != null && controller!.error.isTrue) {
        return widget.error!(controller!);
      } else if (widget.empty != null && controller!.success.isTrue && controller!.empty.isTrue) {
        return widget.empty!(controller!);
      } else {
        return widget.success(controller!);
      }
    });
  }
  
}