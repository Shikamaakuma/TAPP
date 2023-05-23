import 'package:flutter/material.dart';
import 'package:frontend/ui/view/tenant/widget/difficulty_widget.dart';
import 'package:frontend/ui/widget/auto_sized_icon.dart';
import 'package:get/get.dart';

import '../../../../../domain/model/athlete.dart';

class SortableDismissAbleListTile extends StatelessWidget {
  final int index;
  final bool editMode;
  final Future<bool> Function(DismissDirection) confirmDismiss;
  final void Function(DismissDirection) onDismissed;
  final Widget? leading;
  final Widget? trailing;
  final Widget title;
  final Widget? subtitle;

  const SortableDismissAbleListTile(
      {required super.key,
      required this.index,
      required this.editMode,
      required this.confirmDismiss,
      required this.onDismissed,
      this.leading,
      this.trailing,
      required this.title,
      this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key!,
      direction: DismissDirection.startToEnd,
      confirmDismiss: confirmDismiss,
      onDismissed: onDismissed,
      background: Container(
        color: Colors.red,
        child: Row(
          children: const [
            AutoSizedIcon(
              Icons.delete_forever,
              color: Colors.white,
              margin: EdgeInsets.all(4),
            ),
            //Text('Delete'),
          ],
        ),
      ),
      child: ReorderableDragStartListener(
        index: index,
        child: Container(
          margin: const EdgeInsets.all(2),
          child: ListTile(
            leading: leading,
            title: title,
            trailing: !editMode
                ? trailing
                : const Icon(Icons.drag_handle, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
