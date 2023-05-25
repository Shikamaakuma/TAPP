import 'package:flutter/material.dart';

class TappScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  const TappScaffold(
      {super.key,
      this.appBar,
      required this.body,
      this.bottomNavigationBar,
      this.floatingActionButton});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: AppBar(automaticallyImplyLeading: false),
            body: Stack(
              children: [
                if (width >= 1000)
                  Positioned.directional(
                      top: height / 2 - 70,
                      start: (((width - 700) / 2) / 2) - 70 + 5,
                      width: 140,
                      height: 140,
                      textDirection: TextDirection.ltr,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Text(
                          'Tapp is currently optimized for smartphones.',
                        ),
                      )),
                if (width >= 1000)
                  Positioned.directional(
                      top: height / 2 - 70,
                      end: (((width - 700) / 2) / 2) - 70 + 5,
                      width: 140,
                      height: 140,
                      textDirection: TextDirection.ltr,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Text(
                          'Tapp is currently optimized for smartphones.',
                        ),
                      )),
                //
              ],
            )),
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
