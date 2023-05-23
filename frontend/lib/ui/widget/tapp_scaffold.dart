import 'package:flutter/material.dart';

class TappScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const TappScaffold(
      {super.key, this.appBar, required this.body, this.bottomNavigationBar, this.floatingActionButton});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
              automaticallyImplyLeading: false
          ),
        ),
        Center(
          child: ClipRect(
            child: SizedBox(
              width: 700,
              child: Scaffold(
                appBar: appBar,
                body: body,
                bottomNavigationBar: bottomNavigationBar,
                floatingActionButton: floatingActionButton,
              ),
            ),
          ),
        ),
      ],
    );
    body:
    ;
  }
}
