import 'package:flutter/material.dart';
import 'package:one_thousand_and_one_designs/pages/home_page/widgets/dotted_background_painter.dart';

class InfiniteCanvas extends StatelessWidget {
  const InfiniteCanvas({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: DottedBackgroundPainter(
        dotColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
      ),
    );
  }
}
