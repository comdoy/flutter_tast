import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/router/router.dart';
import 'package:flutter_tast/views/home/pages/installs/page/protocol.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../components/services/services.dart';

class InstallPage extends StatefulWidget {
  const InstallPage({Key? key}) : super(key: key);

  @override
  State<InstallPage> createState() => _InstallPageState();
}

class _InstallPageState extends State<InstallPage> {
  bool isLogin = false;

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
    var isLogin = await UserServices.getUserLoginState();
    var userInfo = await UserServices.getUserInfo();
    setState(() {
      this.userInfo = userInfo;
      this.isLogin = isLogin;
      if (userInfo["username"] != null) {
        phone = userInfo["username"];
      }
    });
  }

  Widget textFormItmes(String title, void Function()? onTap, String value) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(221, 216, 212, 212)))),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                )),
            Expanded(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    value,
                    style: const TextStyle(fontSize: 16),
                  )),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFormItme(IconData icon, String title,
      {String? velua, void Function()? onTap}) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.5, color: Color.fromARGB(221, 216, 212, 212)))),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: const Color.fromARGB(255, 56, 55, 55),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  velua ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///个人状态
  String phone = '-';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("设置"),
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
            textFormItme(Icons.people, '手机号', velua: phone),
            textFormItme(
              Icons.lock_outline_sharp,
              '修改密码',
              onTap: () {
                Application.router.navigateTo(context, '/editpassword');
              },
            ),
            textFormItme(
              Icons.image_rounded,
              '更换壁纸',
              onTap: () {
                Application.router.navigateTo(context, '/edit_image');
              },
            ),
            textFormItme(
              Icons.recent_actors,
              '应急联系人',
              onTap: () {
                Fluttertoast.showToast(
                    webBgColor: "#00b09b",
                    webPosition: "right",
                    webShowClose: true,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color.fromARGB(255, 255, 230, 213),
                    textColor: Colors.white,
                    fontSize: 14.0,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    msg: "努力开发中");
              },
            ),
            textFormItme(
              Icons.error_outline,
              '关于懒懒',
              onTap: () {
                Fluttertoast.showToast(
                    webBgColor: "#00b09b",
                    webPosition: "right",
                    webShowClose: true,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color.fromARGB(255, 255, 230, 213),
                    textColor: Colors.white,
                    fontSize: 14.0,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    msg: "努力开发中");
              },
            ),
            textFormItme(
              Icons.help_outline_rounded,
              '帮助与反馈',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Protocol()));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: btnFlatButtonWidget(
                        width: 90,
                        borderRadius: BorderRadius.circular(8.0),
                        fontColor: Colors.cyan.shade200,
                        title: "退出登录",
                        onPressed: showDeleteConfirmDialog1)),
                IconButton(
                    onPressed: showDeleteConfirmDialog1,
                    icon: const Icon(
                      Icons.exit_to_app_sharp,
                      size: 22,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  // 弹出对话框
  Future<bool?> showDeleteConfirmDialog1() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("退出登录提示"),
          content: const Text("您确定要退出当前登录吗?"),
          actions: <Widget>[
            TextButton(
              child: const Text("确定", style: TextStyle(color: Colors.black)),
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
                Application.router.navigateTo(context, '/role_choice'); //关闭对话框
              },
            ),
            TextButton(
              child: const Text(
                "取消",
                style: TextStyle(color: Color.fromARGB(255, 255, 177, 177)),
              ),
              onPressed: () => Navigator.of(context).pop(), //关闭对话框
            ),
          ],
        );
      },
    );
  }
}
