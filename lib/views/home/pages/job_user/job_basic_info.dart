import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/services/services.dart';
import 'package:flutter_tast/components/style/style.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/text_form_itmes.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

import 'package:fluttertoast/fluttertoast.dart';

class JobBasicInfo extends StatefulWidget {
  const JobBasicInfo({Key? key}) : super(key: key);

  @override
  _JobBasicInfoState createState() => _JobBasicInfoState();
}

class _JobBasicInfoState extends State<JobBasicInfo> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _planningController = TextEditingController();
  Map<String, dynamic>? userInfo;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getUserinfo();
    //监听登录页面改变的事件
  }

  _getUserinfo() async {
    var userInfo = await JobUserServices.getJobUserInfo();

    setState(() {
      this.userInfo = userInfo;

      ///头像
      if (userInfo["recruiterimage"] != null) {
        images = userInfo["recruiterimage"].toString();
      } else {
        images =
            'https://pic4.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_hd.jpg?source=1940ef5c';
      }

      ///名称
      if (userInfo["recruitername"] != null) {
        _nicknameController.text = userInfo["recruitername"];
      }
      if (userInfo["recruitername"] != null) {
        name = userInfo["recruitername"];
      }

      ///职位
      if (userInfo["recruiterposition"] != null) {
        position = userInfo["recruiterposition"];
      }

      ///联系电话
      if (userInfo["recruiterphone"] != null) {
        _phoneController.text = userInfo["recruiterphone"];
      }
      if (userInfo["recruiterphone"] != null) {
        phone = userInfo["recruiterphone"];
      }

      ///公司简介
      if (userInfo["recruiterdetails"] != null) {
        recruiter = userInfo["recruiterdetails"];
      }
      if (userInfo["recruiterdetails"] != null) {
        _planningController.text = userInfo["recruiterdetails"];
      }

      ///地址
      if (userInfo["recruitercity"] != null) {
        var str = userInfo["recruitercity"].split(' ');
        locations2 = str;
      }
    });
  }

  doRegister() async {
    if (phone.length < 6) {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "号码格式错误");
    } else {
      var api = '${Config.domain}/recruiter';
      var userInfo = await JobUserServices.getJobUserInfo();
      var response = await Dio().put(api, data: {
        "id": userInfo['id'],
        "recruiterphone": phone,
        "recruitername": name,
        "recruiterposition": position,
        "recruiterdetails": recruiter,
        "recruitercity": spliceCityName(
            pname: locations2[0], cname: locations2[1], tname: locations2[2]),
        "recruiterimage": images
      });
      if (response.data["code"] == '0') {
        await Storage.setString(
            'jobUserInfo', json.encode(response.data["data"]));
        Navigator.pop(context, true);
      } else {
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            msg: "${response.data['msg']}");
      }
    }
  }

  List<String> dataArrs = ["H.R", "CEO", "招聘者", "招聘专员", "董事长", "经理"];

  String images =
      'https://pic4.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_hd.jpg?source=1940ef5c';
  String imagess =
      'https://pic4.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_hd.jpg?source=1940ef5c';

  ///姓名
  String name = '';

  ///职位
  String position = '请选择';

  ///联系电话
  String phone = "";

  ///简介
  String recruiter = '';

  /// 所在区域  省 市 区
  List locations2 = ['', '', ''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("编辑个人信息"),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  doRegister;
                });
              },
              child: const Text(
                "提交",
                style: TextStyle(
                    color: Color.fromARGB(255, 54, 42, 42), fontSize: 16),
              ))
        ],
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
        child: ListView(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          children: [
            TextFormImage(
                title: "头像",
                onTap: () async {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }

                  var res = await Navigator.pushNamed(context, '/myshome');
                  if (res is Map) {
                    images = res['images'];
                    setState(() {});
                  }
                },
                value: images),
            TextFormCell(
                title: '姓名',
                onChanged: (p0) {
                  name = p0;
                },
                controller: _nicknameController),
            TextFormOnTap(
                title: "职位",
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  ShowBottomSheet.showText(context, dataArr: dataArrs,
                      clickCallback: (index, text) {
                    setState(() {
                      position = text;
                    });
                  });
                },
                value: position),
            TextFormCell(
                title: '联系电话',
                onChanged: (p0) {
                  phone = p0;
                },
                controller: _phoneController),
            TextFormOnTap(
              title: "公司城市",
              onTap: () {
                Pickers.showAddressPicker(
                  context,
                  initProvince: locations2[0],
                  initCity: locations2[1],
                  initTown: locations2[2],
                  pickerStyle: RaisedPickerStyle(haveRadius: true),
                  addAllItem: false,
                  onConfirm: (p, c, t) {
                    setState(() {
                      locations2[0] = p;
                      locations2[1] = c;
                      locations2[2] = t;
                    });
                  },
                );
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              value: spliceCityName(
                  pname: locations2[0],
                  cname: locations2[1],
                  tname: locations2[2]),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "公司介绍",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  TextButton(
                    child: Row(
                      children: const [
                        Icon(
                          Icons.touch_app,
                          size: 18,
                          color: Colors.black,
                        ),
                        Text(
                          "查看范文",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            TextFormField(
              maxLength: 200,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              cursorColor: const Color.fromARGB(255, 41, 204, 188),
              onChanged: (p0) {
                recruiter = p0;
              },
              controller: _planningController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                isDense: true,
                border: OutlineInputBorder(
                  gapPadding: 0,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: "请输入",
              ),
            ),
          ],
        ),
      ),
    );
  }

  String spliceCityName({String? pname, String? cname, String? tname}) {
    if (strEmpty(pname)) return '请选择';
    StringBuffer sb = StringBuffer();
    sb.write(pname);
    if (strEmpty(cname)) return sb.toString();
    sb.write(' ');
    sb.write(cname);
    if (strEmpty(tname)) return sb.toString();
    sb.write(' ');
    sb.write(tname);
    return sb.toString();
  }

  /// 字符串为空
  bool strEmpty(String? value) {
    if (value == null) return true;

    return value.trim().isEmpty;
  }
}
