import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AthleteSelectionWidget extends StatelessWidget {

  final String currentName;
  final int numbersLeft;
  final int numbersRight;
  final VoidCallback onLeftClick;
  final VoidCallback onRightClick;

  const AthleteSelectionWidget({super.key, required this.currentName, required this.numbersLeft, required this.numbersRight, required this.onLeftClick, required this.onRightClick});

  @override
  Widget build(BuildContext context) {
    return Container( height: 75, child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(onPressed: onLeftClick, icon: Icon(Icons.arrow_back_ios_new, color: Theme.of(context).primaryColor,)),
        Text(numbersLeft.toString(), textAlign: TextAlign.center, textScaleFactor: 1.4),
        Expanded(child: Container(child: Text(currentName, textAlign: TextAlign.center, textScaleFactor: 1.4),)),
        Text(numbersRight.toString(), textAlign: TextAlign.center, textScaleFactor: 1.4),
        IconButton(onPressed: onRightClick, icon: Icon(Icons.arrow_forward_ios, color: Theme.of(context).primaryColor,)),

      ],
    ),);
  }
}