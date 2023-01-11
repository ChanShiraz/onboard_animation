import 'package:flutter/material.dart';
import 'package:onboard_animation/animation%20package/open_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));
    animationController.animateTo(0);
    super.initState();
  }

  @override
  void dispose() {
    animationController.didRegisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7EBE1),
      body: ClipRect(
        child: Stack(
          children: const [
            MyOpenContainer()
            //MyAnimation(),
            // TopButtons(animationController: animationController),
            // SplashView(animationController: animationController),
            // RelaxView(animationController: animationController),
            // CareView(animationController: animationController),
            // MoodDiaryVew(animationController: animationController),
            // WelcomeView(animationController: animationController),
            // NextButton(
            //   animationController: animationController,
            //   onNextClick: () => _onNextClick(),
            // )
          ],
        ),
      ),
    );
  }

  void _onNextClick() {
    if (animationController.value >= 0 && animationController.value <= 0.2) {
      animationController.animateTo(0.4);
    } else if (animationController.value > 0.2 &&
        animationController.value <= 0.4) {
      animationController.animateTo(0.6);
    } else if (animationController.value > 0.4 &&
        animationController.value <= 0.6) {
      animationController.animateTo(0.8);
    } else if (animationController.value > 0.6 &&
        animationController.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    Navigator.pop(context);
  }
}
