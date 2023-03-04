import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/router/router.dart';
import 'package:flutter_tast/views/home/pages/home/components/glass_widget_info.dart';

class UserInfoCell extends StatelessWidget {
  const UserInfoCell({Key? key, this.itme,this.onTap,this.onLoading}) : super(key: key);
  final UserHomeModel? itme;
  final void Function()? onTap;
   final void Function()? onLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0).copyWith(top: 40),
      child: GlassWidgetInfo(
        width: double.infinity,
        height: 70,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
              child: InkWell(
                onTap: onTap,
                child: SizedBox(
                  child: ImageRect(
                    value: itme?.images,
                  ),
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            itme?.id==null?

            Expanded(
                flex: 1,
                child: InkWell(
                  child: const Text("登录/注册",
                      style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Application.router.navigateTo(context, '/role_choice');
                  },
                ))
            : Expanded(
                flex: 1,
                child: InkWell(
                  onTap:onLoading,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("姓名：${itme?.nickname}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18)),
                      Text("账号：${itme?.username}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
            IconButton(
              onPressed: () {
                Application.router.navigateTo(context, '/jobOffers');
              },
              icon: const Icon(
                Icons.search_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
