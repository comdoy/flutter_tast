import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

class JobUserInfoCell extends StatelessWidget {
  const JobUserInfoCell(
      {Key? key, this.itme, this.userOnTap, this.loginOnTap, this.onPressed,this.lodingOnTap})
      : super(key: key);
  final JobUser? itme;
  ///修改基本信息
  final void Function()? userOnTap;
  ///跳转登录
  final void Function()? loginOnTap;
  ///跳转搜索页
  final void Function()? onPressed;
  ///刷新
  final void Function()? lodingOnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: InkWell(
              onTap: userOnTap,
              child: SizedBox(
                child: ClipRRect(
                  child: SizedBox(
                    child: ImageRect(
                      value: itme?.recruiterImage,
                    ),
                    width: 60,
                    height: 60,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
                width: 60,
                height: 60,
              ),
            ),
          ),
          itme?.id == null
              ? Expanded(
                  flex: 1,
                  child: InkWell(
                    child: const Text("登录/注册",
                        style: TextStyle(color: Colors.black)),
                    onTap: loginOnTap,
                  ))
              : Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap:lodingOnTap,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("姓名：${itme?.recruiterName}",
                            style: const TextStyle(color: Colors.black, fontSize: 18)),
                            const SizedBox(height: 10,),
                        Text("账号：${itme?.recruiterAccount}",
                            style: const TextStyle(color: Colors.black, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.search_sharp,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
