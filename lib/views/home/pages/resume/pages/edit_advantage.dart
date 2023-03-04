
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tast/components/services/edit_details_services.dart';
import 'package:flutter_tast/components/widgets/text_form_itmes.dart';
import 'package:flutter_tast/views/home/pages/resume/bloc/edit_advantage.dart';
import 'package:provider/provider.dart';

class EditAdvantagePage extends StatefulWidget {
  const EditAdvantagePage({Key? key}) : super(key: key);

  @override
  _EditAdvantagePageState createState() => _EditAdvantagePageState();
}

class _EditAdvantagePageState extends State<EditAdvantagePage> {
  final TextEditingController _advantagenameController =
      TextEditingController();

  final TextEditingController _responsmoduleController =
      TextEditingController();

  final TextEditingController _advantagecontentController =
      TextEditingController();
  bool isLogin = false;
  Map<String, dynamic>? editresumedetails;

  @override
  void initState() {
    super.initState();
    _getUserinfo();
  }

  ///姓名
  String advantagename = '';

  ///联系电话
  String advantagecontent = "";

  ///负责模块
  String responsmodule = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("编辑核心优势"),
        actions: [
          Consumer<EditAdvantageBloc>(builder: (context, model, child) {
            return TextButton(
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                  context.read<EditAdvantageBloc>().putAdvantage(
                      advantagename, responsmodule, advantagecontent);

                  Navigator.pop(context, true);
                },
                child: const Text(
                  "提交",
                  style: TextStyle(
                      color: Color.fromARGB(255, 54, 42, 42), fontSize: 18),
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
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          children: [
            TextFormCell(
              title: '项目名称',
              onChanged: (p0) {
                advantagename = p0;
              },
              controller: _advantagenameController,
            ),
            TextFormCell(
              title: '负责模块',
              onChanged: (p0) {
                responsmodule = p0;
              },
              controller: _responsmoduleController,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "项目内容",
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
              inputFormatters: [LengthLimitingTextInputFormatter(200)],
              keyboardType: TextInputType.multiline,
              maxLines: 26,
              cursorColor: const Color.fromARGB(255, 41, 204, 188),
              onChanged: (p0) {
                advantagecontent = p0;
              },
              controller: _advantagecontentController,
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

  _getUserinfo() async {
    var editresumedetails = await EditDetailsServices.getUserInfo();

    setState(() {
      this.editresumedetails = editresumedetails;
      isLogin = isLogin;
      if (editresumedetails["advantagenames"] != null) {
        _advantagenameController.text = editresumedetails["advantagenames"];
      }
      if (editresumedetails["advantagenames"] != null) {
        advantagename = editresumedetails["advantagenames"];
      }

      if (editresumedetails["responsmodule"] != null) {
        _responsmoduleController.text = editresumedetails["responsmodule"];
      }
      if (editresumedetails["responsmodule"] != null) {
        responsmodule = editresumedetails["responsmodule"];
      }

      if (editresumedetails["advantagecontents"] != null) {
        _advantagecontentController.text =
            editresumedetails["advantagecontents"];
      }
      if (editresumedetails["advantagecontents"] != null) {
        advantagecontent = editresumedetails["advantagecontents"];
      }
    });
  }
}
