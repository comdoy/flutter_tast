import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/router/router.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../installs/page/protocol.dart';

class JobEnroll extends StatefulWidget {
  const JobEnroll({Key? key}) : super(key: key);

  @override
  _JobEnrollState createState() => _JobEnrollState();
}

class _JobEnrollState extends State<JobEnroll> {
  bool _selected = false;
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _passwordControllers = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  //表单状态
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String password = '';
  String username = '';
  String nickname = '';
  String repassword = ''; //验证密码
  @override
  void dispose() {
    // eventBus.fire(UserEvent('注册成功...'));
    super.dispose();
  }

  doRegister() async {
    RegExp regex =
        RegExp(r"^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]9[89])\d{8}$");
    if (!regex.hasMatch(username)) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "账号格式错误");
    } else if (password.length < 6) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "密码格式错误");
    } else if (password != repassword) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "密码和确认密码不一致");
    } else {
      var api = '${Config.domain}/recruiter/registers';
      var response = await Dio().post(api, data: {
        "recruiter_account": username,
        "recruiter_password": password,
        "recruiter_name": nickname
      });
      if (response.data["code"] == '0') {
        await Storage.setString('jobUserInfo', json.encode(response.data["data"]));
        Navigator.pop(context, {
            "jobusername": username,
            "jobpassword": password,
          });
      } else {
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            msg: "${response.data['msg']}");
      }
    }
  }

  Widget _buildInputForm() {
    return SizedBox(
      width: 295,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 30,
                height: 30,
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      Application.router.navigateTo(context, '/job_login');
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                    )),
              )
            ],
          ),
          Container(
            height: 90,
            width: 90,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Image.asset('assets/images/c.png'),
          ),
          const Text(
            "懒懒招聘注册中心",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: 20,
          ),
          inputTextEdit(
            onChanged: (value) {
              username = value;
            },
            borderradius: const BorderRadius.only(
                bottomLeft: Radius.circular(16), topRight: Radius.circular(16)),
            controller: _phoneController,
            keyboardType: TextInputType.emailAddress,
            hintText: "账号",
            marginTop: 0,
            // autofocus: true,
          ),
          const SizedBox(
            height: 20,
          ),
          inputTextEdit(
              onChanged: (value) {
                password = value;
              },
              borderradius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(16)),
              controller: _passwordController,
              keyboardType: TextInputType.emailAddress,
              hintText: "密码",
              marginTop: 0,
              isPassword: true),
          const SizedBox(
            height: 20,
          ),
          inputTextEdit(
              onChanged: (value) {
                repassword = value;
              },
              borderradius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(16)),
              controller: _passwordControllers,
              keyboardType: TextInputType.emailAddress,
              hintText: "确认密码",
              marginTop: 0,
              isPassword: true),
          const SizedBox(
            height: 20,
          ),
          inputTextEdit(
            onChanged: (value) {
              nickname = value;
            },
            borderradius: const BorderRadius.only(
                bottomLeft: Radius.circular(16), topRight: Radius.circular(16)),
            controller: _nicknameController,
            keyboardType: TextInputType.emailAddress,
            hintText: "昵称",
            marginTop: 0,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 22,
                child: Checkbox(
                    splashRadius: 2,
                    checkColor: Colors.orange,
                    value: _selected,
                    onChanged: (bool? value) {
                      setState(() {
                        _selected = value!;
                      });
                    }),
              ),
              RichText(
                text: TextSpan(
                    text: '我已阅读',
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                          text: '《用户协议》',
                          style: TextStyle(
                              color: Colors.blue[600],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Protocol()));
                            })
                    ]),
              ),
              Expanded(
                flex: 1,
                child: btnFlatButtonWidget(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    onPressed: doRegister,
                    gbColor: AppColors.primaryElements,
                    title: "注册",
                    fontColor: AppColors.primaryText,
                    fontSize: 34),
              ),
            ],
          ),
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

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
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
                        380, height * 0.65, _buildInputForm()))),
          ],
        ),
      ),
    );
  }
}