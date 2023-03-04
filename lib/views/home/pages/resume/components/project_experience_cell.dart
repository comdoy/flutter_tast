import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/project_exprience_model.dart';
import 'package:flutter_tast/views/home/pages/resume/components/rich_text_itme.dart';

class ProjectExperienceCell extends StatelessWidget {
  const ProjectExperienceCell({Key? key, this.model, this.onTap})
      : super(key: key);
  final ProjectExperienceModel? model;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 180),
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: Colors.white,
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage("assets/images/k.png")),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 28),
                  child: Text(
                    "项目心得",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    richTextItme(
                        label: "项目名称", value: model?.projectname ?? '-'),
                    richTextItme(label: "担任角色", value: model?.role ?? '-'),
                    richTextItme(label: "完成进度", value: model?.schedule ?? '-'),
                    richTextItme(
                        label: "项目背景", value: model?.background ?? '-'),
                    richTextItme(
                        label: "项目心得体会", value: model?.experience ?? '-'),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
