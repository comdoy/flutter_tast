import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/widgets/Image_rect.dart';
import 'package:flutter_tast/views/home/pages/resume/components/components.dart';

class PersonalInformationCell extends StatelessWidget {
  const PersonalInformationCell({Key? key, this.model, this.onTap})
      : super(key: key);
  final UserHomeModel? model;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 180),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("assets/images/i.png")),
          ),
          padding: const EdgeInsets.only(
            left: 100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richTextItme(label: "姓名", value: model?.nickname ?? '-'),
                  Row(
                    children: [
                      richTextItme(
                        label: "年龄",
                        value: '${model?.age} ${"岁      "}',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      richTextItme(
                        label: "性别",
                        value: model?.sex ?? '-',
                      ),
                    ],
                  ),
                  richTextItme(label: "身份", value: model?.identity ?? '-'),
                  richTextItme(
                    label: "学历",
                    value: model?.educational ?? "-",
                  ),
                  richTextItme(label: "联系电话", value: model?.username ?? '-'),
                  richTextItme(label: "家庭地址", value: model?.address ?? '-'),
                ],
              )),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: ImageRect(
                        value: model?.images,
                      ),
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(height: 90,),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: Color.fromARGB(255, 131, 168, 159),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
