import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend/appShell.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _bgEase;
  late final Animation<double> _fadeLogo;
  late final Animation<double> _fadeBowls;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );

    _bgEase = CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);
    _fadeLogo = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.25, 0.85, curve: Curves.easeOut),
    );
    _fadeBowls = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.45, 1.0, curve: Curves.easeOut),
    );

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2600));
      if (!mounted) return;

      Navigator.of(context).pushReplacement(_createFadeRoute());
    });
  }

  Route _createFadeRoute() {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 600),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      opaque: true,
      maintainState: true,
      pageBuilder: (context, animation, secondaryAnimation) => const AppShell(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic);
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 0.02),
              end: Offset.zero,
            ).animate(curved),
            child: child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    final finalTop = -size.height * 0.06;
    final finalLeft = -size.width * 1.80;
    final finalHeight = size.height * 1.30;

    final startTop = -size.height * 0.12;
    final startLeft = -size.width * 2.00;
    final startHeight = size.height * 1.10;

    return Scaffold(
      backgroundColor: cs.primary,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _bgEase.value;
          final bgTop = lerpDouble(startTop, finalTop, t)!;
          final bgLeft = lerpDouble(startLeft, finalLeft, t)!;
          final bgHeight = lerpDouble(startHeight, finalHeight, t)!;

          return Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: bgTop,
                left: bgLeft,
                child: SizedBox(
                  height: bgHeight,
                  child: SvgPicture.asset(
                    'assets/images/splash_background.svg',
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              SafeArea(
                child: Center(
                  child: FadeTransition(
                    opacity: _fadeLogo,
                    child: Image.asset('assets/images/logo_splash.png', width: 200),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: FadeTransition(
                  opacity: _fadeBowls,
                  child: SimpleShadow(
                    color: const Color(0xFFEAC3AA),
                    opacity: 0.8,
                    sigma: 60,
                    child: Image.asset('assets/images/foodbowl1_splash.png'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: FadeTransition(
                  opacity: _fadeBowls,
                  child: SimpleShadow(
                    color: const Color(0xFFEAC3AA),
                    opacity: 0.8,
                    offset: const Offset(-8, -8),
                    sigma: 60,
                    child: Image.asset('assets/images/foodbowl2_splash.png'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
