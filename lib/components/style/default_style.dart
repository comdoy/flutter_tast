import 'package:flutter/material.dart';
import 'package:flutter_tast/components/style/picker_style.dart';

import '../widgets/my_text.dart';

/// 圆角按钮样式
class RaisedPickerStyle extends PickerStyle {
  RaisedPickerStyle({
    bool haveRadius = false,
    String? title,
  }) {
    if (haveRadius) {
      headDecoration = const BoxDecoration(
          color: Color.fromARGB(255, 250, 249, 249),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), topRight: Radius.circular(8)));
    }
    menuHeight = 36.0;
    menu = Container(
        color: const Color.fromARGB(255, 231, 230, 230),
        height: menuHeight,
        child: Row(children: const [
          Expanded(child: Center(child: MyText('省', color: Colors.white))),
          Expanded(child: Center(child: MyText('市', color: Colors.white))),
          Expanded(child: Center(child: MyText('区/县', color: Colors.white))),
        ]));
    itemOverlay = Container(
      decoration: const BoxDecoration(
        border: Border.symmetric(
            horizontal: BorderSide(color: Colors.grey, width: 0.7)),
      ),
    );
    this.title = const Center(
        child:
            MyText('请选择地址', color: Color.fromARGB(255, 19, 18, 18), size: 14));
    commitButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(right: 22),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 237, 241, 241),
          borderRadius: BorderRadius.circular(4)),
      child: const MyText('确认', color: Color.fromARGB(255, 74, 177, 196), size: 14),
    );

    cancelButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(left: 22),
      decoration: BoxDecoration(
          border:
              Border.all(color: const Color.fromARGB(255, 74, 177, 196), width: 1),
          borderRadius: BorderRadius.circular(4)),
      child: const MyText('取消', color: Color.fromARGB(255, 20, 20, 20), size: 14),
    );

    if (title != null && title != '') {
      this.title = Center(
          child:
              Text(title, style: const TextStyle(color: Colors.grey, fontSize: 14)));
    }
  }

  /// 夜间
  RaisedPickerStyle.dark(
      {bool haveRadius = false, String? title, Color? color}) {
    headDecoration = BoxDecoration(
        color: Colors.grey[800],
        borderRadius: !haveRadius
            ? null
            : const BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)));

    commitButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      margin: const EdgeInsets.only(right: 22),
      decoration: BoxDecoration(
          color: color ?? Colors.blue, borderRadius: BorderRadius.circular(4)),
      child: const Text('确定', style: TextStyle(color: Colors.white, fontSize: 15.0)),
    );

    cancelButton = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      margin: const EdgeInsets.only(left: 22),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(4)),
      child: const Text('取消', style: TextStyle(color: Colors.white, fontSize: 15.0)),
    );

    if (title != null && title != '') {
      this.title = Center(
          child:
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 14)));
    }

    backgroundColor = Colors.grey[800]!;
    textColor = Colors.white;
  }
}
