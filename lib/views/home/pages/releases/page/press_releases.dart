import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/text_form_itmes.dart';
import 'package:flutter_tast/views/home/pages/releases/bloc/press_releases.dart';
import 'package:provider/provider.dart';

class PressReleases extends StatefulWidget {
  const PressReleases({Key? key, this.pressid}) : super(key: key);
  final String? pressid;
  @override
  State<PressReleases> createState() => _PressReleasesState();
}

class _PressReleasesState extends State<PressReleases> {

  ///图片
  String pressImage = '';

  ///新闻标题
  String pressTitle = '';

  ///新闻内容
  String pressText = '';

  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  DateTime? dateTimes = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("新闻发布"),
        actions: [
          Consumer<PressReleasesBloc>(builder: (context, model, child) {
            return IconButton(
                onPressed: () {
                  context.read<PressReleasesBloc>().postReleases(
                      widget.pressid,
                      pressText,
                      pressImage,
                      pressTitle,
                      dateTimes.toString().substring(0, 19));
                  Navigator.pop(context, true);
                },
                icon: const Text("提交"));
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
            TextFormImage(
                title: "新闻图片",
                onTap: () async {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  }

                  var res = await Navigator.pushNamed(context, '/myshome',
                      arguments: {"image": pressImage});
                  if (res is Map) {
                    pressImage = res['images'];
                    setState(() {});
                  }
                },
                value: pressImage),
            const Text(
              "温馨提示🔈：读者更喜欢有图片的新闻！！！",
              style: TextStyle(color: Color.fromARGB(255, 218, 197, 79)),
            ),
            TextFormCell(
                title: '新闻标题',
                onChanged: (p0) {
                  pressTitle = p0;
                },
                controller: _nicknameController),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: Text(
                      "新闻内容",
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
              maxLength: 800,
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              cursorColor: const Color.fromARGB(255, 41, 204, 188),
              onChanged: (p0) {
                pressText = p0;
              },
              controller: _usernameController,
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
}
