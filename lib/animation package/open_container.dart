import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class MyOpenContainer extends StatelessWidget {
  const MyOpenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: OpenContainer(
                  transitionDuration: const Duration(seconds: 1),
                  openBuilder: (context, action) => const SecondScreen(),
                  closedBuilder: (context, action) => InkWell(
                        onTap: action,
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.black26,
                        ),
                      )),
            ),
          ],
        ),
      ),
      floatingActionButton: OpenContainer(
        openBuilder: (context, action) => const SecondScreen(),
        closedBuilder: (context, action) => IconButton(
            onPressed: action,
            icon: const Icon(
              Icons.edit_note,
              size: 30,
              color: Colors.blue,
            )),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.black26,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back'))
          ],
        ),
      ),
    );
  }
}
