
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../components/services/services.dart';
import '../../../../../router/router.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({Key? key}) : super(key: key);

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  Map<String, dynamic>? userInfo;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getUserinfo();
  }

  _getUserinfo() async {
    var userInfo = await UserServices.getUserInfo();
    setState(() {
      this.userInfo = userInfo;
    });
  }

  dologin() async {
    if (newpassword.length < 6) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "密码格式不正确");
    } else if (password == newpassword) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "和旧密码相同");
    } else if (newpassword != repassword) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "密码和确认密码不一致");
    } else {
      var userInfo = await UserServices.getUserInfo();
      var api = '${Config.domain}/user/login';
      var response = await Dio().post(api, data: {
        "password": password,
        "username": userInfo["username"]
      });
      if (response.data["code"] == '0') {
        var userInfo = await UserServices.getUserInfo();
        var apia = '${Config.domain}/user';
        var responsec = await Dio().put(apia,
            data: {"id": userInfo["id"], "password": newpassword});
        if (responsec.data["code"] == "0") {
          showDeleteConfirmDialog1();
        } else {
          Fluttertoast.showToast(
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              msg: "${responsec.data['msg']}");
        }
      } else {
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            msg: "输入的旧密码不正确");
      }
    }
  }

  Widget textFormItme(
    String title,
    void Function(String)? onChanged, {
    TextEditingController? controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.5, color: Color.fromARGB(221, 216, 212, 212)))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                ),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              )),
          Expanded(
            flex: 7,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: controller,
                    cursorColor: const Color.fromARGB(255, 41, 204, 188),
                    onChanged: onChanged,
                    decoration: const InputDecoration(
                      hintText: "请输入",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 14, right: 5),
                  child: Icon(
                    Icons.border_color_sharp,
                    // color: Color.fromARGB(255, 41, 204, 188),
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  String password = '';
  String newpassword = '';
  String repassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          
          title: const Text("修改密码"),
        ),
        body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            child: Column(
              children: [
                textFormItme("旧密码", (p0) {
                  password = p0;
                }),
                textFormItme("新密码", (p0) {
                  newpassword = p0;
                }),
                textFormItme("确认新密码", (p0) {
                  repassword = p0;
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 14),
                        child: btnFlatButtonWidget(
                            width: 120,
                            borderRadius: BorderRadius.circular(8.0),
                            fontColor: Colors.cyan.shade200,
                            title: "确认修改密码",
                            onPressed: dologin)),
                    IconButton(
                        onPressed: dologin,
                        icon: const Icon(
                          Icons.exit_to_app_sharp,
                          size: 22,
                        ))
                  ],
                )
              ],
            )));
  }

  Future<bool?> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("提示"),
          content: const Text("当前登录状态发生改变请重新登录"),
          actions: <Widget>[
            TextButton(
                child: const Text("去登录", style: TextStyle(color: Colors.black)),
                onPressed: () {
                  UserServices.loginOut();
                  EditDetailsServices.loginOut();
                  EditCareerServices.loginOut();
                  EditEducateServices.loginOut();
                  EditProjectServices.loginOut();
                  OccupationalServices.loginOut();
                  // EditDetailsServices.loginOut;
                  _getUserinfo();
                  // ... 执行删除操作
                  Application.router.navigateTo(context, '/role_choice');
                }),
          ],
        );
      },
    );
  }
}
