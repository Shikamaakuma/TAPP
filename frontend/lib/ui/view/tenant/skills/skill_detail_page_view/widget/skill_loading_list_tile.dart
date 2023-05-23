import 'package:flutter/material.dart';

import '../../../../../widget/shimmer_widgets.dart';

class SkillLoadingListTile extends StatelessWidget {

  const SkillLoadingListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Container(
          width: 54,
          height: 54,
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        title: const ShimmerText(),
      ),);
  }
}