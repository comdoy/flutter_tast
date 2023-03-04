import 'package:flutter/material.dart';
import 'package:flutter_tast/components/style/picker_style.dart';
import '../style/address_picker_route.dart';
import '../style/default_style.dart';


/// [onChanged]   选择器发生变动
/// [onConfirm]   选择器提交
/// [pickerStyle] 样式
/// [suffix] 后缀
class Pickers {
  /// 自定义 地区选择器
  /// [initProvince] 初始化 省
  /// [initCity]    初始化 市
  /// [initTown]    初始化 区
  /// [onChanged]   选择器发生变动
  /// [onConfirm]   选择器提交
  /// [addAllItem] 市、区是否添加 '全部' 选项     默认：true
  static void showAddressPicker(BuildContext context,
      {PickerStyle? pickerStyle,
      String initProvince: '',
      String initCity: '',
      String? initTown,
      bool addAllItem: true,
      AddressCallback? onChanged,
      AddressCallback? onConfirm,
      Function(bool isCancel)? onCancel,
      bool overlapTabBar = false}) {
    if (pickerStyle == null) {
      pickerStyle = RaisedPickerStyle();
    }
    if (pickerStyle.context == null) {
      pickerStyle.context = context;
    }

    Navigator.of(context, rootNavigator: overlapTabBar).push(AddressPickerRoute(
      pickerStyle: pickerStyle,
      initProvince: initProvince,
      initCity: initCity,
      initTown: initTown,
      onChanged: onChanged,
      onConfirm: onConfirm,
      onCancel: onCancel,
      addAllItem: addAllItem,
      theme: Theme.of(context),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    ));
  }
}
