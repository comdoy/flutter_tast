import 'package:flutter/material.dart';
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     List<Widget> widgetList = [];
    //如果正在加载，则显示加载添加加载中布局
    
      //增加一层黑色背景透明度为0.8
      widgetList.add(
        Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              color: Color.fromARGB(221, 166, 166, 166),
            )),
      );
      //环形进度条
      widgetList.add(Center(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              //黑色背景
              color: Colors.black87,
              //圆角边框
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            //控件里面内容主轴负轴剧中显示
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            //主轴高度最小
            mainAxisSize: MainAxisSize.min,
          children: const <Widget>[      
            CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
            Text(
                '加载中...',
                style: TextStyle(color: Colors.white),
              )
          ],
        ),
      ),
    ));
    return Stack(
      children: widgetList,
    );
  }
}

