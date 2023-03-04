import 'package:flutter/material.dart';

class RichTextItem extends StatelessWidget {
  const RichTextItem({Key? key, 
    this.label,
    this.value,
    this.padding,
    this.fontSize = 15,
    this.color,
    this.divider = true,
    this.textSpan = true,
  }) : super(key: key);

  ///左侧标题
  final String? label;

  ///显示的内容
  final String? value;

  ///调整上下左右边距
  final EdgeInsetsGeometry? padding;

  ////字体大小
  final double fontSize;

  ///字体颜色
  final Color? color;

  ///分割线，为false不显示
  final bool? divider;

  ///为false 无间隔
  final bool? textSpan;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 12),
          child: Text.rich(
            
            textSpan == true
                ? TextSpan(
                    text: "$label\t\t\t",
                    style: TextStyle(fontSize: fontSize, color: Colors.grey),
                    children: [
                        TextSpan(
                          text: "$value",
                          style: TextStyle(
                            inherit: true,
                            fontSize: fontSize,
                            color: color ??Theme.of(context).cardColor,
                          ),
                        )
                      ])
                : TextSpan(
                    text: "$label",
                    style: TextStyle(fontSize: fontSize,),
                    children: [
                        TextSpan(
                          text: "$value",
                          style: TextStyle(
                            inherit: true,
                            fontSize: fontSize,
                          ),
                        )
                      ]),
          
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          ),
        ),
        divider == true
            ? const Divider(
                height: 1,
              )
            : const SizedBox()
      ],
    );
  }
}

