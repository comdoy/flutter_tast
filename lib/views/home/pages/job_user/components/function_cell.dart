import 'package:flutter/material.dart';
import 'package:flutter_tast/router/router.dart';

class FunctionCell extends StatelessWidget {
  const FunctionCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget itemFunction(
        {Function()? onPressed, IconData? icon, required String title}) {
      return ColoredBox(
        color: Theme.of(context).cardColor,
        child: 
        // InkWell(
        //   onTap: onPressed,
        //   borderRadius:,
        //   overlayColor: MaterialStateProperty.all(Color.fromARGB(255, 175, 231, 239)),
        //   child: ,
        // ),
        TextButton(
            style: ButtonStyle(
              overlayColor:
                  MaterialStateProperty.all(const Color.fromARGB(255, 175, 231, 239)),
              //设置边框
              side: MaterialStateProperty.all(
                  const BorderSide(color: Colors.grey, width: 0.5)),
            ),
            onPressed: onPressed,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: Icon(
                    icon,
                    color: Colors.black,
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            )),
      );
    }
    return Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          itemFunction(
            title: "招聘管理",
            icon: Icons.folder_shared,
            onPressed: () {
              Application.router.navigateTo(context, '/job_manage');
            },
          ),
          itemFunction(
            title: "求职申请",
            icon: Icons.location_city,
            onPressed: () {
              Application.router.navigateTo(context, '/userinfo');
            },
          ),
          itemFunction(
            title: "新闻管理",
            icon: Icons.local_library,
            onPressed: () {
              Application.router.navigateTo(context, '/job_new');
            },
          ),
          itemFunction(
            title: "基本信息",
            icon: Icons.account_circle,
            onPressed: () {
              Application.router.navigateTo(context, '/job_basic_info');
            },
          ),
           itemFunction(
            title: "人员管理",
            icon: Icons.account_circle,
            onPressed: () {
              Application.router.navigateTo(context, '/job_basic_info');
            },
          ),
        ]));
  }
}
