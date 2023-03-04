import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/text_form_itmes.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/edit_information.dart';

import 'package:provider/provider.dart';
import '../../../../../components/style/style.dart';
import '../../../../../components/utils/utils.dart';

class EditResumePage extends StatefulWidget {
  const EditResumePage({Key? key}) : super(key: key);
  @override
  _EditResumePageState createState() => _EditResumePageState();
}

class _EditResumePageState extends State<EditResumePage> {
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  Map<String, dynamic>? userInfo;
  @override
  void initState() {
    super.initState();
    _getUserinfo();
  }

  List<String> dataArrs = ["男", "女", "未知"];
  List<String> bloodType = ["A型", "B型", "O型", "AB型", "未知型"];
  List<String> identityList = ["应届生", "毕业生", "职场新人", "职场牛人", "未知"];
  List<String> educationalList = ["小学", "初中", "高中/高职", "大专", "本科", "研究生"];
  // String selection = '请选择';

  ///姓名
  String nickname = '';

  ///年龄
  String age = '';

  ///性别
  String sex = '请选择';

  ///联系电话
  String username = "";

  ///个人身份
  String identity = '请选择';

  ///最高学历
  String educational = '请选择';

  /// 所在区域  省 市 区
  List locations2 = ['', '', ''];

  String images = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("编辑个人信息"),
        actions: [
          Consumer<EditResumeBloc>(
            builder: (context, value, child) => TextButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  String address = spliceCityName(
                      pname: locations2[0],
                      cname: locations2[1],
                      tname: locations2[2]);
                  context.read<EditResumeBloc>().putUser(username, nickname,
                      sex, identity, educational, address, images, age);
                  Navigator.pop(context, true);
                },
                child: const Text(
                  "提交",
                  style: TextStyle(
                      color: Color.fromARGB(255, 54, 42, 42), fontSize: 16),
                )),
          )
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

                  var res = await Navigator.pushNamed(context, '/myshome',
                      arguments: {"image": images});

                  if (res is Map) {
                    images = res['images'];
                    setState(() {});
                  }
                },
                value: images),
            const Text(
              "温馨提示🔈：招聘者更加青睐真实头像求职者噢！！！",
              style: TextStyle(color: Color.fromARGB(255, 218, 197, 79)),
            ),
            TextFormCell(
                title: '姓名',
                onChanged: (p0) {
                  nickname = p0;
                },
                controller: _nicknameController),
            TextFormOnTap(
                title: "性别",
                onTap: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  ShowBottomSheet.showText(context, dataArr: dataArrs,
                      clickCallback: (index, text) {
                    setState(() {
                      sex = text;
                    });
                  });
                },
                value: sex),
            TextFormCell(
                title: "年龄",
                onChanged: (po) {
                  age = po;
                },
                controller: _ageController),
            TextFormOnTap(
                title: "我的身份",
                onTap: () {
                  ShowBottomSheet.showText(context, dataArr: identityList,
                      clickCallback: (index, text) {
                    setState(() {
                      identity = text;
                    });
                  });
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                value: identity),
            TextFormOnTap(
                title: "最高学历",
                onTap: () {
                  ShowBottomSheet.showText(context, dataArr: educationalList,
                      clickCallback: (index, text) {
                    setState(() {
                      educational = text;
                    });
                  });
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                value: educational),
            TextFormCell(
                title: '联系电话',
                onChanged: (p0) {
                  username = p0;
                },
                controller: _usernameController),
            TextFormOnTap(
              title: "现居地址",
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

  _getUserinfo() async {
    var userInfo = await UserServices.getUserInfo();
    print(userInfo);
    setState(() {
      this.userInfo = userInfo;

      if (userInfo["images"] != null) {
        images = userInfo["images"].toString();
      }

      if (userInfo["nickname"] != null) {
        _nicknameController.text = userInfo["nickname"];
      }
      if (userInfo["nickname"] != null) {
        nickname = userInfo["nickname"];
      }

      if (userInfo["age"] != null) {
        _ageController.text = userInfo["age"].toString();
      }
      if (userInfo["age"] != null) {
        age = userInfo["age"].toString();
      }

      if (userInfo["username"] != null) {
        _usernameController.text = userInfo["username"];
      }
      if (userInfo["username"] != null) {
        username = userInfo["username"];
      }

      if (userInfo["identity"] != null) {
        identity = userInfo["identity"];
      }
      if (userInfo["sex"] != null) {
        sex = userInfo["sex"];
      }
      if (userInfo["educational"] != null) {
        educational = userInfo["educational"];
      }
      if (userInfo["address"] != null) {
        var str = userInfo["address"].split(' ');
        locations2 = str;
      }
    });
  }
}
