import 'package:flutter/material.dart';
import 'package:flutter_tast/components/utils/colors.dart';
import 'package:flutter_tast/components/values/radii.dart';
/// 输入框
Widget inputTextEdit({
  @required TextEditingController? controller,
  TextInputType keyboardType = TextInputType.text,
  Widget? icon,
  String? hintText,
  bool isPassword = false,
  double? marginTop,
  bool autofocus = false,
  void Function(String)? onChanged,
  BorderRadiusGeometry? borderradius = Radii.k6pxRadius,
  InputBorder? border,
  EdgeInsetsGeometry? contentPadding,
  double? height,
  BoxBorder? borders
}) {
  return Container(
    height:height?? 44,
    margin: EdgeInsets.only(top: marginTop??15),
    
    child: TextField(
      onChanged: onChanged,
      cursorColor: Colors.orange.shade200,
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        icon: icon,
        hintText: hintText,
        contentPadding: contentPadding??const EdgeInsets.fromLTRB(15, 5, 0, 9),
        border: border??InputBorder.none,
      ),
      style: const TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}

/// email 输入框
/// 背景白色，文字黑色，带阴影
Widget inputEmailEdit({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String? hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: 44,
    margin: EdgeInsets.only(top: marginTop),
    decoration: const BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: Radii.k6pxRadius,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        // hintStyle: const TextStyle(
        //   color: AppColors.primaryText,
        // ),
      ),
      style: const TextStyle(
        color: AppColors.primaryText,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
