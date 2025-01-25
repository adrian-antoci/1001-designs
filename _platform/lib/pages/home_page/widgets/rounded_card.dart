import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  const RoundedCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white10,
        ),
        child: Container(
          margin: const EdgeInsets.all(40 / 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(left: 295),
          child: child,
        ),
      ),
    );
  }
}
