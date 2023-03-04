import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:flutter_tast/router/applaction.dart';

class RoleChoice extends StatelessWidget {
  const RoleChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Image.asset('assets/images/c.png'),
          ),
          const Text(
            "请选择你的需求",
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: btnFlatButtonWidget(
                      width: 90,
                      borderRadius: BorderRadius.circular(8.0),
                      fontColor: Colors.cyan.shade200,
                      title: "招聘者",
                      onPressed: () {
                        Application.router.navigateTo(context, '/job_login');})),
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: btnFlatButtonWidget(
                      width: 90,
                      borderRadius: BorderRadius.circular(8.0),
                      fontColor: Colors.cyan.shade200,
                      title: "求职者",
                      onPressed: () {
                        Application.router.navigateTo(context, '/login');
                      })),
            ],
          )
        ],
      ),
    );
  }
}
