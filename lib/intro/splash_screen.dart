import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  final AnimationController animationController;
  const SplashView({super.key, required this.animationController});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    final introductionAnimation =
        Tween(begin: const Offset(0, 0), end: const Offset(0, -1)).animate(
            CurvedAnimation(
                parent: widget.animationController,
                curve: const Interval(0, 0.2, curve: Curves.fastOutSlowIn)));
    return SlideTransition(
      position: introductionAnimation,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/introduction_image.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                'Clearhead',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Text(
                "Lorem ipsum dolor sit amet,consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: InkWell(
                onTap: () => widget.animationController.animateTo(0.2),
                child: Container(
                  height: 45,
                  width: 160,
                  decoration: const BoxDecoration(
                      color: Color(0xff132137),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: const Center(
                    child: Text("Let's Begin",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
