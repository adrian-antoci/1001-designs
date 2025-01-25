import 'package:flutter/material.dart';

class Spacer extends StatelessWidget {
  const Spacer({super.key, this.dimension = 16});
  const Spacer.thirtyTwo({super.key, this.dimension = 32});
  const Spacer.custom({super.key, required this.dimension});

  final double dimension;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(dimension: dimension);
  }
}
