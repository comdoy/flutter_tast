import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/eduscational_model.dart';
import 'package:flutter_tast/views/home/pages/resume/components/components.dart';

class EducationCell extends StatelessWidget {
  const EducationCell({Key? key, this.model, this.onTap}) : super(key: key);
  final EduscationalItmeModel? model;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 180),
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: InkWell(
        onTap:onTap,
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("assets/images/j.png")),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "教育经历",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Icon(
                          Icons.arrow_circle_left,
                          size: 18,
                          color: Color.fromARGB(255, 131, 168, 159),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    richTextItme(label: "毕业学校", value: model?.graduatedschool ?? '-'),
                    richTextItme(label: "就读专业", value: model?.profession ?? '-'),
                    richTextItme(label: "毕业时间", value: model?.period ?? '-'),
                    richTextItme(label: "是否全日制", value: model?.whether ?? '-'),
                    richTextItme(label: "最高学历", value: model?.education ?? '-'),
                    richTextItme(label: "校园经历", value: model?.experience ?? '-'),
                    
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
