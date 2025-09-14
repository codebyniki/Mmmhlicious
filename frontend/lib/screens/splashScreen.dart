import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/homeScreen.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedSplashScreen(
      splash: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                alignment: Alignment.topCenter,
                child: Transform.translate(
                  offset: const Offset(-210, -40),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1.3,
                    child: SvgPicture.asset(
                      'assets/images/splash_background.svg',
                      fit: BoxFit.contain,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/logo_splash.png',
                width: 200,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleShadow(
                  color: const Color(0xFFEAC3AA),
                  opacity: 0.8,
                  sigma: 60,
                  child: Image.asset(
                    'assets/images/foodbowl1_splash.png'
                  ),
                ),
                SimpleShadow(
                  color: const Color(0xFFEAC3AA),
                  opacity: 0.8,
                  offset: const Offset(-8, -8),
                  sigma: 60,
                  child: Image.asset(
                      'assets/images/foodbowl2_splash.png'
                  ),
                ),
              ],
            )
          ],
        ),
      ),

      nextScreen: const HomeScreen(),
      splashIconSize: size.longestSide,
      duration: 3200,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: colorScheme.primary,
    );
  }
}
