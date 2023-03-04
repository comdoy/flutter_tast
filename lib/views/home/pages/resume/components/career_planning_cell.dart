import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/career_planning_model.dart';
import 'package:flutter_tast/views/home/pages/resume/components/components.dart';

class PlanningCell extends StatelessWidget {
  const PlanningCell({Key? key, this.model, this.onTap}) : super(key: key);
  final CareerPlanningModel? model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/images/l.png")),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 82,right: 30),
                    child: Text(
                      "职业规划",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.arrow_circle_left,
                    size: 18,
                    color: Color.fromARGB(255, 131, 168, 159),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richTextItme(label: "未来几年", value: model?.future ?? '-',),
                  richTextItme(label: "从事行业", value: model?.industry ?? '-'),
                  richTextItme(label: "薪资期望", value: model?.salary ?? '-'),
                  richTextItme(label: "学习目标", value: model?.target ?? '-'),
                  richTextItme(label: "后续规划", value: model?.planning ?? '-'),
                ],
              ),
            ],
          )),
    );
  }
}
