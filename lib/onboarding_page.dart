import 'package:flutter/material.dart';
import 'package:watchparty_ui/secondonboarding_Page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SecondOnboardingPage(),
            ),
          );
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 2),
                  builder: (context, double opacity, child) {
                    return Opacity(
                      opacity: opacity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset('assets/Rectangle 1.png'),
                          const Positioned.fill(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'JUST US GIRLS\nGLOBAL NETWORK',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1.5, 1.5),
                                          blurRadius: 3.0,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'girl child, girl friends, girl power',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1.5, 1.5),
                                          blurRadius: 3.0,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: const Duration(seconds: 2),
                  builder: (context, double opacity, child) {
                    return Opacity(
                      opacity: opacity,
                      child: Image.asset('assets/ballontail.png'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
