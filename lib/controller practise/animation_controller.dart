import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class MyAnimation extends StatefulWidget {
  const MyAnimation({super.key});

  @override
  State<MyAnimation> createState() => _MyAnimationState();
}

class _MyAnimationState extends State<MyAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    //animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Animation<Offset> sizeAnimation =
        Tween<Offset>(begin: const Offset(2, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: animationController,
                curve: const Interval(0, 0.2, curve: Curves.fastOutSlowIn)));
    var widthAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.0, 0.2, curve: Curves.fastOutSlowIn)));

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return InkWell(
                  onTap: () {
                    animationController.animateTo(0.2);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 1.0 + (widthAnimation.value * 100)),
                    child: Container(
                      height: 50,
                      width: 50.0 + (widthAnimation.value * 100.0),
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(50)),
                      child: PageTransitionSwitcher(
                        duration: const Duration(milliseconds: 400),
                        transitionBuilder:
                            (child, primaryAnimation, secondaryAnimation) =>
                                SharedAxisTransition(
                          animation: primaryAnimation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.vertical,
                          fillColor: Colors.transparent,
                          child: child,
                        ),
                        child: animationController.value >= 0.2
                            ? const Text(
                                'After',
                                key: ValueKey('value'),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            : const Text(
                                'Before',
                                key: ValueKey('Before'),
                              ),
                      ),
                    ),
                  ),
                );
              },
            ),
            // FirstPage(animationController: animationController),
            // SecondPage(animationController: animationController),
            // NextButton(onClick: () {
            //   animationController.animateTo(0.2);
            // })
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key, required this.animationController});
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    Animation<Offset> firstAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0))
            .animate(CurvedAnimation(
                parent: animationController, curve: const Interval(0, 0.2)));
    return SlideTransition(
      position: firstAnimation,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black26,
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.animationController});
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    Animation<Offset> firstAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: animationController, curve: const Interval(0, 0.2)));
    return SlideTransition(
      position: firstAnimation,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 100),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.onClick});
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child:
                  ElevatedButton(onPressed: onClick, child: const Text('Next')))
        ],
      ),
    );
  }
}
