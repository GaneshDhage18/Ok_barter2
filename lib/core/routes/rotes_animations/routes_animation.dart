import 'package:okbarter2/core/extensions/app_imports.dart';

/// ================= FADE TRANSITION =================
Widget _fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(opacity: animation, child: child);
}

/// ================= SLIDE TRANSITION =================
Widget slideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final tween = Tween<Offset>(
    begin: const Offset(1, 0),
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.easeInOut));
  return SlideTransition(position: animation.drive(tween), child: child);
}

Widget rotationFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final rotate = Tween<double>(
    begin: 0.2,
    end: 0.0,
  ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut));
  final fade = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));

  return FadeTransition(
    opacity: fade,
    child: RotationTransition(turns: rotate, child: child),
  );
}

Widget slideUpFadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  final slideTween = Tween<Offset>(
    begin: const Offset(0, 1), // bottom → top
    end: Offset.zero,
  ).chain(CurveTween(curve: Curves.easeOutCubic));

  final fadeTween = Tween<double>(
    begin: 0.0, // invisible
    end: 1.0, // fully visible
  ).chain(CurveTween(curve: Curves.easeIn));

  return SlideTransition(
    position: animation.drive(slideTween),
    child: FadeTransition(opacity: animation.drive(fadeTween), child: child),
  );
}
