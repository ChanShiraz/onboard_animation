import 'package:flutter/material.dart';

class AniSwitcher extends StatefulWidget {
  const AniSwitcher({super.key});

  @override
  State<AniSwitcher> createState() => _AniSwitcherState();
}

class _AniSwitcherState extends State<AniSwitcher> {
  int count = 0;
  double height = 100;
  double width = 200;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 450),
            child: Container(
              key: ValueKey('valueKey'),
              height: height,
              width: width,
              color: Colors.limeAccent,
            ),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  height = 200;
                  width = 100;
                });
              },
              child: Text('Add'))
        ],
      ),
    );
  }
}
