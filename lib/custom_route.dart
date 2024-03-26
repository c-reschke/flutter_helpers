import 'package:flutter/material.dart';

enum Begin { top, left, right, bottom }

class CustomRoute {
  final Widget page;
  final Begin beginAnim;
  final Duration duration;

  CustomRoute({
    required this.page,
    this.beginAnim = Begin.bottom,
    this.duration = const Duration(milliseconds: 300),
  });

  Route<T> createRoute<T>() {
    return PageRouteBuilder<T>(
      transitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final beginOffset = _offsets[beginAnim] ?? Offset.zero;
        const end = Offset.zero;
        const curve = Curves.easeOut;

        final tween = Tween(begin: beginOffset, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static final Map<Begin, Offset> _offsets = {
    Begin.top: const Offset(0.0, -1.0),
    Begin.left: const Offset(-1.0, 0.0),
    Begin.right: const Offset(1.0, 0.0),
    Begin.bottom: const Offset(0.0, 1.0),
  };
}

// Exemplo de uso:
// final route = CustomRoute(page: MyPage(), beginAnim: Begin.right);
// Navigator.push(context, route.createRoute());