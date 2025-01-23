import 'package:flutter/material.dart';

class ScaleOnHoverWidget extends StatefulWidget {
  const ScaleOnHoverWidget({super.key, required this.child});

  final Widget child;

  @override
  State<ScaleOnHoverWidget> createState() => _ScaleOnHoverWidgetState();
}

class _ScaleOnHoverWidgetState extends State<ScaleOnHoverWidget> with SingleTickerProviderStateMixin {
  late AnimationController scaleAnimationController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    scaleAnimation = Tween(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(
        parent: scaleAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    scaleAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => scaleAnimationController.forward(),
      onExit: (_) => scaleAnimationController.reverse(),
      child: ScaleTransition(
        scale: scaleAnimation,
        alignment: Alignment.center,
        filterQuality: FilterQuality.high,
        child: widget.child,
      ),
    );
  }
}
