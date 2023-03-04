 import 'package:flutter/material.dart';
import 'package:flutter_tast/components/utils/rich_text.dart';
 
 
 Widget richTextItme({required String label, required String value,EdgeInsetsGeometry? padding}) {
    return RichTextItem(
      padding: padding??const EdgeInsets.only(top: 5),
      textSpan: false,
      label: '$label：',
      value: value,
      divider: false,
    );
  }