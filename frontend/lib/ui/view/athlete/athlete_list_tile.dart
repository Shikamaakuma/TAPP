import 'package:flutter/material.dart';

class AthleteListTile extends StatelessWidget {
  final String name;

  const AthleteListTile({super.key, required this.name});

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
        title: Text(name),
      ),);
  }
}

class ShimmerAthleteListTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Container(
            width: 54,
            height: 54,
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
