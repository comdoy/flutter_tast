// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_tast/components/utils/colors.dart';
import 'package:flutter_tast/components/values/radii.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  @required VoidCallback? onPressed,
  double width = 140,
  double height = 44,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
  BorderRadiusGeometry borderRadius = Radii.k6pxRadius,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(gbColor), //背景颜色
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          )),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: duSetFontSize(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}

duSetFontSize(double fontSize) {}

