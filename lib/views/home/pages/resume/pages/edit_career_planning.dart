import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/services/edit_career_services.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/show_modal_bottom.dart';
import 'package:flutter_tast/components/widgets/text_form_itmes.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/edit_career_planning.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class EditCareerPlanning extends StatefulWidget {
  const EditCareerPlanning({Key? key}) : super(key: key);

  @override
  State<EditCareerPlanning> createState() => _EditCareerPlanningState();
}

class _EditCareerPlanningState extends State<EditCareerPlanning> {
  Map<String, dynamic>? editCareer;
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    _getcareerInfo();
  }

  Dio dio = Dio();
  oncareer() async {
    var api = '${Config.domain}/edit_career';
    var userInfo = await UserServices.getUserInfo();
    var response = await dio.put(api, data: {
      "user_id": userInfo["id"],
      "future": future,
      "industry": industry,
      "salary": salary,
      "target": target,
      "planning": planning,
    });
    if (response.data["code"] == '0') {
      await Storage.setString("editCareer", json.encode(response.data["data"]));
      Navigator.pop(context, true);
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("编辑职业规划"),
        actions: [
          Consumer<EditCareerPlanningBloc>(builder: (context, modle, child) {
            return TextButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  context
                      .read<EditCareerPlanningBloc>()
                      .putPlanning(future, industry, salary, target, planning);
                  Navigator.pop(context, true);
                },
                child: const Text(
                  "提交",
                  style: TextStyle(
                      color: Color.fromARGB(255, 54, 42, 42), fontSize: 16),
                ));
          })
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
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          children: [
            TextFormOnTap(
              title: "未来几年",
              onTap: () {
                ShowBottomSheet.showText(context, dataArr: futureList,
                    clickCallback: (index, text) {
                  setState(() {
                    future = text;
                  });
                });
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              value: future,
            ),
            TextFormCell(
                title: '从事行业',
                onChanged: (p0) {
                  industry = p0;
                },
                controller: _industryController),
            TextFormCell(
                title: '薪资期望',
                onChanged: (p0) {
                  salary = p0;
                },
                controller: _salaryController),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "学习目标",
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
                target = p0;
              },
              controller: _targetController,
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
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "后续规划",
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
                planning = p0;
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

  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _salaryController = TextEditingController();
  final TextEditingController _targetController = TextEditingController();
  final TextEditingController _planningController = TextEditingController();
  List<String> futureList = ["未来一年", "未来两年", "未来三年"];

  String future = '';
  String industry = '';
  String salary = '';
  String target = '';
  String planning = '';
  _getcareerInfo() async {
    var editCareer = await EditCareerServices.getUserInfo();
    setState(() {
      this.editCareer = editCareer;
      if (editCareer["future"] != null) {
        future = editCareer["future"];
      }

      if (editCareer["industry"] != null) {
        industry = editCareer["industry"];
      }
      if (editCareer["industry"] != null) {
        _industryController.text = editCareer["industry"];
      }

      if (editCareer["salary"] != null) {
        salary = editCareer["salary"];
      }
      if (editCareer["salary"] != null) {
        _salaryController.text = editCareer["salary"];
      }

      if (editCareer["target"] != null) {
        target = editCareer["target"];
      }
      if (editCareer["target"] != null) {
        _targetController.text = editCareer["target"];
      }

      if (editCareer["planning"] != null) {
        planning = editCareer["planning"];
      }
      if (editCareer["planning"] != null) {
        _planningController.text = editCareer["planning"];
      }
    });
  }
}
