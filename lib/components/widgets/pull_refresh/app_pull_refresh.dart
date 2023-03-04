
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
 
class AppPullRefresh extends StatelessWidget {
  final Widget child;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final bool initialRefresh;
  const AppPullRefresh(
      {Key? key,
      required this.child,
      this.onRefresh,
      this.onLoading,
      this.initialRefresh = false})
      : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        footerTriggerDistance: 15,
        dragSpeedRatio: 0.91,
        headerBuilder: () => const ClassicHeader(),
        footerBuilder: () => const ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return false;
        },
        child: child);
  }
}
 
class AppSmartRefresher extends StatelessWidget {
  final Widget child;
  final RefreshController controller;
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
 
  const AppSmartRefresher({
    Key? key,
    required this.child,
    required this.controller,
    this.onRefresh,
    this.onLoading,
  }) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      // header: WaterDropHeader(),
      header: const ClassicHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = const Text("上拉加载");
          } else if (mode == LoadStatus.loading) {
            body = const CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = const Text("加载失败！点击重试！");
          } else if (mode == LoadStatus.canLoading) {
            body = const Text("松手,加载更多!");
          } else {
            body = const Text("没有更多数据了!");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: child,
    );
  }
}