import 'package:flutter/cupertino.dart';


class TappLogo extends StatelessWidget {
  const TappLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 250, minWidth: 200, minHeight: 120),
        child: Image.asset('assets/tapp.png'),
      ),
    );
  }
}
