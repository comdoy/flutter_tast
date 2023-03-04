import 'package:flutter/material.dart';
import 'package:flutter_tast/components/services/edit_educate_services.dart';
import 'package:flutter_tast/components/widgets/show_modal_bottom.dart';
import 'package:flutter_tast/components/widgets/text_form_itmes.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/edit_eduscational.dart';
import 'package:provider/provider.dart';

class EditEducateExperience extends StatefulWidget {
  const EditEducateExperience({Key? key}) : super(key: key);

  @override
  State<EditEducateExperience> createState() => _EditEducateExperienceState();
}

class _EditEducateExperienceState extends State<EditEducateExperience> {
  Map<String, dynamic>? editEducate;
  bool isLogin = false;
  @override
  void initState() {
    super.initState();
    _getexperienceInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("编辑教育经历"),
        actions: [
          Consumer<EditEduscationalBloc>(builder: (context, model, child) {
            return TextButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  context.read<EditEduscationalBloc>().putEduscat(
                      graduatedschool,
                      profession,
                      period,
                      whether,
                      education,
                      experience);
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
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          children: [
            TextFormCell(
                title: '毕业学校',
                onChanged: (p0) {
                  graduatedschool = p0;
                },
                controller: _graduatedschoolController),
            TextFormCell(
                title: '就读专业',
                onChanged: (p0) {
                  profession = p0;
                },
                controller: _professionController),
            TextFormCell(
                title: '毕业时间',
                onChanged: (p0) {
                  period = p0;
                },
                controller: _periodController),
            TextFormOnTap(
                title: "是否全日制",
                onTap: () {
                  ShowBottomSheet.showText(context, dataArr: whetherList,
                      clickCallback: (index, text) {
                    setState(() {
                      whether = text;
                    });
                  });
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                value: whether),
            TextFormOnTap(
                title: "最高学历",
                onTap: () {
                  ShowBottomSheet.showText(context, dataArr: educationList,
                      clickCallback: (index, text) {
                    setState(() {
                      education = text;
                    });
                  });
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
                value: education),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "校园经历",
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
              maxLines: 17,
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

  final TextEditingController _graduatedschoolController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();
  final TextEditingController _periodController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  List<String> whetherList = ["是", "否"];
  List<String> educationList = ["小学", "初中", "高中/高职", "大专", "本科", "研究生"];

  ///毕业学校
  String graduatedschool = '';

  ///就读专业

  String profession = '';

  ///毕业时间
  String period = '';

  ///是否全日制
  String whether = '';

  ///最高学历
  String education = '';

  ///校园经历
  String experience = '';
  _getexperienceInfo() async {
    var editEducate = await EditEducateServices.getUserInfo();
    setState(() {
      this.editEducate = editEducate;
      isLogin = isLogin;

      ///毕业学校
      if (editEducate["graduatedschool"] != null) {
        _graduatedschoolController.text = editEducate["graduatedschool"];
      }
      if (editEducate["graduatedschool"] != null) {
        graduatedschool = editEducate["graduatedschool"];
      }

      ///就读专业
      if (editEducate["profession"] != null) {
        _professionController.text = editEducate["profession"];
      }
      if (editEducate["profession"] != null) {
        profession = editEducate["profession"];
      }

      ///毕业时间
      if (editEducate["period"] != null) {
        _periodController.text = editEducate["period"];
      }
      if (editEducate["period"] != null) {
        period = editEducate["period"];
      }

      ///是否全日制
      if (editEducate["whether"] != null) {
        whether = editEducate["whether"];
      }

      ///最高学历
      if (editEducate["education"] != null) {
        education = editEducate["education"];
      }

      ///校园经历
      if (editEducate["experience"] != null) {
        _experienceController.text = editEducate["experience"];
      }
      if (editEducate["experience"] != null) {
        experience = editEducate["experience"];
      }
    });
  }
}
