import 'package:flutter/material.dart';

import '../../../../widget/shimmer_widgets.dart';

class AthleteLoadingListTile extends StatelessWidget {
  const AthleteLoadingListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListTile(
        leading: LoadingShimmer(
          isLoading: true,
          child: Container(
            width: 54,
            height: 54,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
        title: const LoadingShimmer(
          isLoading: true,
          child: ShimmerText(
            width: 120,
          ),
        ),
      ),
    );
  }
}