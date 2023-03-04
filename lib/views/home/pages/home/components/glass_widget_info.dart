import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

class GlassWidgetInfo extends StatelessWidget {
  const GlassWidgetInfo(
      {Key? key,
      this.width,
      required this.height,
      this.child,
      this.andtwo = true})
      : super(key: key);
  final double? width;
  final double height;
  final Widget? child;
  final bool? andtwo;
  @override
  Widget build(BuildContext context) {
    return andtwo != true
        ? Container(
            // padding: EdgeInsets.all(5),
            margin: const EdgeInsets.only(top: 10),
            height: height,
            child: child,
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
          )
        : GlassWidget(
            width: width,
            height: height,
            borderRadius: 5,
            blur: 14,
            linearGradientBeginOpacity: 0.3,
            linearGradientEndOpacity: 0.2,
            borderGradientBeginOpacity: 0.5,
            borderGradientEndOpacity: 0.02,
            child: child,
          );
  }
}
