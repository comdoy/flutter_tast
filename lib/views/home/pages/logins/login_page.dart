// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // email的控制器
  final TextEditingController _emailController = TextEditingController();
  // 密码的控制器
  final TextEditingController _passController = TextEditingController();

  //监听登录页面销毁的事件
  @override
  dispose() {
    super.dispose();
    // eventBus.fire(UserEvent('登录成功...'));
  }

  var dio = Dio();
  String username = '';
  String password = '';
  doLogin() async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    if (username.length < 6) {
      Fluttertoast.showToast(
        msg: '手机不正确',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } else if (password.length < 6) {
      Fluttertoast.showToast(
        msg: '密码不正确',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } else {
      var api = '${Config.domain}/user/login';
      var response = await dio.post(api, data: {
        "username": username,
        "password": password
      }).timeout(const Duration(seconds: 3));
      if (response.data["code"] == 0) {
        //保存用户信息
        await Storage.setString('userInfo', json.encode(response.data["data"]));
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/',
          (route) => route == null,
        );
      } else {
        Fluttertoast.showToast(
          msg: '${response.data["msg"]}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    }
  }

  Widget _buildInputForm() {
    return Container(
      width: 295,
      margin: const EdgeInsets.only(top: 49),
      child: Column(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Image.asset('assets/images/c.png'),
          ),
          const Text(
            "懒懒登录中心",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          // email input
          inputTextEdit(
            onChanged: (value) {
              username = value;
            }, 
            contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            hintText: "账号",
            marginTop: 0,
            // autofocus: true,
          ),
          // password input
          inputTextEdit(
            onChanged: (value) {
              password = value;
            },
            contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            hintText: "密码",
            isPassword: true,
          ),

          // 注册、登录 横向布局
          Container(
            height: 44,
            margin: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                // 注册
                btnFlatButtonWidget(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  width: 147,
                  onPressed: () async {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus &&
                        currentFocus.focusedChild != null) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                    var res = await Navigator.pushNamed(context, '/enroll');
                    if (res is Map) {
                      _emailController.text = res['username'];
                      username = res['username'];
                      _passController.text = res['password'];
                      password = res['password'];
                      setState(() {});
                    }
                  },
                  gbColor: AppColors.thirdElement,
                  title: "注册",
                ),
                // 登录
                btnFlatButtonWidget(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                  width: 147,
                  onPressed: doLogin,
                  gbColor: AppColors.primaryElements,
                  title: "登录",
                ),
              ],
            ),
          ),
          // Spacer(),
          TextButton(
            onPressed: () => {},
            child: const Text(
              "忘记密码?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondaryElementText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1, // 设置下行高，否则字体下沉
              ),
            ),
          ),
          // Fogot password
        ],
      ),
    );
  }

  Widget glassWidgetinfo(double width, double height, Widget? child) {
    return GlassWidget(
      width: width,
      height: height,
      borderRadius: 5,
      blur: 50,
      linearGradientBeginOpacity: 0.3,
      linearGradientEndOpacity: 0.2,
      borderGradientBeginOpacity: 0.5,
      borderGradientEndOpacity: 0.02,
      child: child,
    );
  }

  final FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: SizedBox(
          height: height,
          width: width,
          child: Stack(
            children: <Widget>[
              Image.asset(
                'assets/images/b.png',
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              Positioned(
                  left: 6,
                  top: 90,
                  child: Center(
                      child: glassWidgetinfo(
                          380, height * 0.6, _buildInputForm()))),
              // SafeArea(
              //     child: Center(
              //         child:
              //             glassWidgetinfo(380, height * 0.6, _buildInputForm()))),
            ],
          ),
        ),
      ),
    );
  }
}
