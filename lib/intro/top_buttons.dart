import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key, required this.animationController});
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final topDownaAnimation =
        Tween(begin: const Offset(0, -1), end: const Offset(0, 0)).animate(
            CurvedAnimation(
                parent: animationController,
                curve: const Interval(0.15, 0.2, curve: Curves.fastOutSlowIn)));
    final upAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(0, -2)).animate(
            CurvedAnimation(
                parent: animationController,
                curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn)));
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SlideTransition(
        position: upAnimation,
        child: SlideTransition(
          position: topDownaAnimation,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  )),
              const Text('Skip     ')
            ],
          ),
        ),
      ),
    );
  }
}
