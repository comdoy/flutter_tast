import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/utils/rich_text.dart';

DateTime dateTime = DateTime.now();

class AdvantageCell extends StatelessWidget {
  const AdvantageCell({Key? key, this.model,this.onTap}) : super(key: key);
  final AdvantageModel? model;
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
                  fit: BoxFit.fill, image: AssetImage("assets/images/h.png")),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 28),
                  child: Text(
                    "个人优势",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 152, top: 5),
                            child: Text(
                              "${dateTime.year}年${dateTime.month}月${dateTime.day}日",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Color.fromARGB(255, 131, 168, 159),
                          ),
                        ],
                      ),
                      RichTextItem(
                        padding:
                            const EdgeInsets.only(top: 8),
                        textSpan: false,
                        label: '项目名称：',
                        value: model?.advantagenames ?? '-',
                        divider: false,
                      ),
                      RichTextItem(
                        padding:
                            const EdgeInsets.only(top: 4),
                        textSpan: false,
                        label: '负责模块：',
                        value: model?.responsmodule == ''||model?.responsmodule == null
                            ? '-'
                            : model?.responsmodule,
                        divider: false,
                      ),
                      RichTextItem(
                        padding:
                            const EdgeInsets.only(top: 4),
                        textSpan: false,
                        label: '项目内容：',
                        value: model?.advantagecontents == ''||model?.advantagecontents ==null
                            ? '-'
                            : model?.advantagecontents,
                        divider: false,
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
