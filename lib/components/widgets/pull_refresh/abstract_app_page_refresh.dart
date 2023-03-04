// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/pull_refresh/app_pull_refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
 
///M 为 驱动页面页面要展示的 数据类型   泛型  W 则是要展示的页面 约束自 StatefullWidget
abstract class AbstractAppPageRefresh<M, W extends StatefulWidget>
    extends State<W> with AutomaticKeepAliveClientMixin {
  List<M> dataList = [];
  int pageIndex = 1;
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
 
  onRefresh();//下拉刷新
  onLoading();//上拉加载更多
  buildView();//根据数据展示 列表类容；这几放在了继承类中实现  灵活性更强
 
  @override
  void initState() {
    super.initState();
    onRefresh();
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppSmartRefresher(
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        child: buildView(),
      ),
    );
  }
 
  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }
}