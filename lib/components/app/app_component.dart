import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/utils/colors.dart';

import '../../router/applaction.dart';
import '../../router/routers.dart';

class AppComponent extends StatefulWidget {
  const AppComponent({Key? key}) : super(key: key);

  @override
  State createState() {
    return AppComponentState();
  }
}

class AppComponentState extends State<AppComponent> {
  AppComponentState() {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
      
      theme: ThemeData(
          // primarySwatch是主题颜色的一个样本，通过它可以在一些条件下生成一些其他的属性
          // 如果没有指定primaryColor，并且当前主题不是深色主题，
          // 那么primaryColor就会默认为primarySwatch指定的颜色，
          // 还有一些相似的属性如accentColor、indicatorColor等也会受其影响
          primarySwatch: AppColors.white, //主题颜色样本
          primaryColor: Colors.white, //深色还是浅色
         ),
      title: '找工作来懒懒',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
    );
// print("initial route = ${app.initialRoute}");
    return app;
  }
}
