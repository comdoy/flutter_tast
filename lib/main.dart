// ignore_for_file: unused_local_variable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tast/components/app/app_component.dart';
import 'package:flutter_tast/proivder_setup.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
    providers:providers,
    child: const AppComponent(),
  ));
  if (Platform.isAndroid) {
    // 这一步设置状态栏颜色为透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  } // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final router = FluroRouter();
//     Routes.configureRoutes(router);
//     Application.router = router;
//     return MaterialApp(
//       initialRoute: '/resume',
      
//       debugShowCheckedModeBanner: false,
//       onGenerateRoute: Application.router.generator,
//     );
//   }
// }
