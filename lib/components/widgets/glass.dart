// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? blur;
  final double? linearGradientBeginOpacity;
  final double? linearGradientEndOpacity;
  final double? borderGradientBeginOpacity;
  final double? borderGradientEndOpacity;
  final Widget? child;
  const GlassWidget({
    @required this.width,
    @required this.blur,
    @required this.borderGradientBeginOpacity,
    @required this.borderGradientEndOpacity,
    @required this.borderRadius,
    @required this.child,
    @required this.height,
    @required this.linearGradientBeginOpacity,
    @required this.linearGradientEndOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      alignment: Alignment.bottomCenter,
      width: width!,
      border: 2,
      blur: blur!,
      borderRadius: borderRadius!,
      height: height!,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFFFFFFF).withOpacity(linearGradientBeginOpacity!),
            const Color(0xFFFFFFFF).withOpacity(linearGradientEndOpacity!),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFFFFFFF).withOpacity(linearGradientBeginOpacity!),
          const Color(0xFFFFFFFF).withOpacity(linearGradientEndOpacity!),
        ],
      ),
      child: child,
    );
  }
}

