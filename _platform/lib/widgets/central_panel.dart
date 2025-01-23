import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:zoomable_interactive_viewer/zoomable_interactive_viewer.dart';

class CentralPanel extends StatelessWidget {
  CentralPanel({super.key});
  static const double _cardMargin = 40;
  static const double _borderRadius = 40;
  static const double _blur = 20;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: GlassmorphicContainer(
        height: double.infinity,
        width: double.infinity,
        borderRadius: _borderRadius,
        blur: _blur,
        alignment: Alignment.bottomCenter,
        border: 0,
        linearGradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [
          const Color(0xFFffffff).withOpacity(0.1),
          const Color(0xFFFFFFFF).withOpacity(0.05),
        ], stops: const [
          0.1,
          1,
        ]),
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.5),
            const Color(0xFFFFFFFF).withOpacity(0.5),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.all(_cardMargin / 3),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(_borderRadius),
            ),
          ),
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_borderRadius),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 350, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("#21"),
                        Text("Some design name"),
                      ],
                    )),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: ZoomableInteractiveViewer(
                    panEnabled: true,
                    maxScale: 10,
                    minScale: 0.1,
                    enableAnimation: false,
                    scaleEnabled: true,
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: 350,
                          right: 350,
                        ),
                        child: SvgPicture.network(
                          'assets/vector.svg',
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
