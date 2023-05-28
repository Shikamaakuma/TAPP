

import 'package:flutter/material.dart';

/// Default alert banner
class AlertBanner extends StatelessWidget {

  final Color backgroundColor;
  final Color textColor;
  final IconData? iconData;
  final String text;

  const AlertBanner({super.key, required this.backgroundColor, required this.textColor, this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: backgroundColor
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(iconData, color: textColor,),
          SizedBox(width: 16,),
          Text(text, textScaleFactor: 1.2, style: TextStyle(color: textColor),)
        ],
      ),
    );
  }

  factory AlertBanner.info(String text) {
    return AlertBanner(backgroundColor: Colors.lightBlueAccent, textColor: Colors.black, text: text, iconData: Icons.warning,);
  }

}