import 'package:flutter/material.dart';
import 'package:flutter_tast/components/services/edit_project_services.dart';
import 'package:flutter_tast/components/widgets/show_modal_bottom.dart';
import 'package:flutter_tast/components/widgets/text_form_itmes.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/edit_project.dart';
import 'package:provider/provider.dart';

class EditProjectBackground extends StatefulWidget {
  const EditProjectBackground({Key? key}) : super(key: key);

  @override
  State<EditProjectBackground> createState() => _EditProjectBackgroundState();
}

class _EditProjectBackgroundState extends State<EditProjectBackground> {
  Map<String, dynamic>? editProject;
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    _getcareerInfo();
  }

  List<String> scheduleList = [
    "完成20%",
    "完成40%",
    "完成60%",
    "完成80%",
    "已完成",
  ];

  String projectname = '';
  String role = '';
  String schedule = '请选择';
  String background = '';
  String experience = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("编辑项目背景"),
        actions: [
          Consumer<EditProjectBloc>(builder: (context, model, child) {
            return TextButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  context.read<EditProjectBloc>().putProject(
                      projectname, role, schedule, background, experience);
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
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 0),
          children: [
            TextFormCell(
              title: '项目名称',
              onChanged: (p0) {
                projectname = p0;
              },
              controller: _projectnameController,
            ),
            TextFormCell(
                title: '担任角色',
                onChanged: (p0) {
                  role = p0;
                },
                controller: _roleController),
            TextFormOnTap(
              title: '项目名称',
              onTap: () {
                ShowBottomSheet.showText(context, dataArr: scheduleList,
                    clickCallback: (index, text) {
                  setState(() {
                    schedule = text;
                  });
                });
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              value: schedule,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "项目背景",
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
                background = p0;
              },
              controller: _backgroundController,
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
                      "项目心得体会",
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
                experience = p0;
              },
              controller: _experienceController,
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

  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _projectnameController = TextEditingController();
  final TextEditingController _backgroundController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  _getcareerInfo() async {
    var editProject = await EditProjectServices.getUserInfo();
    print(editProject);
    setState(() {
      this.editProject = editProject;
      if (editProject["schedule"] != null) {
        schedule = editProject["schedule"];
      }

      if (editProject["projectname"] != null) {
        projectname = editProject["projectname"];
      }
      if (editProject["projectname"] != null) {
        _projectnameController.text = editProject["projectname"];
      }

      if (editProject["role"] != null) {
        role = editProject["role"];
      }
      if (editProject["role"] != null) {
        _roleController.text = editProject["role"];
      }

      if (editProject["background"] != null) {
        background = editProject["background"];
      }
      if (editProject["background"] != null) {
        _backgroundController.text = editProject["background"];
      }

      if (editProject["experience"] != null) {
        experience = editProject["experience"];
      }
      if (editProject["experience"] != null) {
        _experienceController.text = editProject["experience"];
      }
    });
  }
}
