// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class CareView extends StatelessWidget {
  const CareView({super.key, required this.animationController});
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    final firstHalfAnimation = Tween(begin: Offset(1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)));
    final secondHalfAnimation = Tween(begin: Offset(0, 0), end: Offset(-1, 0))
        .animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));
    final careImageFirstHalfAnimation =
        Tween(begin: Offset(4, 0), end: Offset(0, 0)).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)));
    final careImageSecondHalfAnimation =
        Tween(begin: Offset(0, 0), end: Offset(-4, 0)).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));
    final textFirstHalfAnimation = Tween(begin: Offset(2, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.2, 0.4, curve: Curves.fastOutSlowIn)));
    final textSecondHalfAnimation =
        Tween(begin: Offset(0, 0), end: Offset(-2, 0)).animate(CurvedAnimation(
            parent: animationController,
            curve: Interval(0.4, 0.6, curve: Curves.fastOutSlowIn)));

    return SlideTransition(
      position: firstHalfAnimation,
      child: SlideTransition(
        position: secondHalfAnimation,
        child: Padding(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SlideTransition(
                position: careImageFirstHalfAnimation,
                child: SlideTransition(
                  position: secondHalfAnimation,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 350, maxHeight: 250),
                    child: Image.asset('assets/images/care_image.png'),
                  ),
                ),
              ),
              SlideTransition(
                position: textFirstHalfAnimation,
                child: SlideTransition(
                  position: textSecondHalfAnimation,
                  child: const Text(
                    "Care",
                    style:
                        TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 16, top: 16),
                child: Text(
                  "Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
