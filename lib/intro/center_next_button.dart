import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class NextButton extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onNextClick;
  const NextButton(
      {super.key,
      required this.animationController,
      required this.onNextClick});

  @override
  Widget build(BuildContext context) {
    final topAnimation =
        Tween(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(0, 0.2, curve: Curves.fastOutSlowIn),
    ));
    final signUpAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: animationController,
            curve: const Interval(0.6, 0.8, curve: Curves.fastOutSlowIn)));
    final loginTextMoveAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return Padding(
      padding:
          EdgeInsets.only(bottom: 16 + MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SlideTransition(
            position: topAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) => AnimatedOpacity(
                  opacity: animationController.value >= 0.2 &&
                          animationController.value <= 0.6
                      ? 1
                      : 0,
                  duration: const Duration(milliseconds: 480),
                  child: Center(child: pageView())),
            ),
          ),
          SlideTransition(
            position: topAnimation,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: 38 - (38 * signUpAnimation.value)),
                  child: Container(
                    height: 58,
                    width: 58.0 + (200 * signUpAnimation.value),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          8 + 32.0 * (1 - signUpAnimation.value)),
                      color: const Color(0xff132137),
                    ),
                    child: PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 480),
                      transitionBuilder:
                          (child, primaryAnimation, secondaryAnimation) =>
                              SharedAxisTransition(
                        animation: primaryAnimation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.horizontal,
                        fillColor: Colors.transparent,
                        child: child,
                      ),
                      child: signUpAnimation.value > 0.7
                          ? InkWell(
                              key: const ValueKey('Sign in button'),
                              onTap: onNextClick,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Text(
                                      'Sign Up',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_rounded,
                                        color: Colors.white),
                                  ],
                                ),
                              ),
                            )
                          : InkWell(
                              key: const ValueKey('next button'),
                              onTap: onNextClick,
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.arrow_forward_ios_rounded,
                                    color: Colors.white),
                              ),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SlideTransition(
              position: loginTextMoveAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xff132137),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageView() {
    int currentIndex = 0;
    if (animationController.value >= 0.7) {
      currentIndex = 3;
    } else if (animationController.value >= 0.5) {
      currentIndex = 2;
    } else if (animationController.value >= 0.3) {
      currentIndex = 1;
    } else if (animationController.value >= 0.1) {
      currentIndex = 0;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 4; i++)
            Padding(
                padding: const EdgeInsets.all(4),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 480),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: currentIndex == i
                        ? const Color(0xff132137)
                        : const Color(0xffE3E4E4),
                  ),
                ))
        ],
      ),
    );
  }
}
