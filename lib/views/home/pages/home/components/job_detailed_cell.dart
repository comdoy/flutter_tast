import 'package:flutter/material.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

class JobDetailedCell extends StatelessWidget {
  const JobDetailedCell({Key? key, this.model, this.onPressed,this.userJudge})
      : super(key: key);
  final OffersItem? model;
  final void Function()? onPressed;
  final bool? userJudge;

  @override
  Widget build(BuildContext context) {
    Future<bool?> showDeleteConfirmDialog1() {
      return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("投递提示"),
            content: Text("您确定要向${model?.jobcompany}投递简历吗?"),
            actions: <Widget>[
              TextButton(
                  child: const Text("确定", style: TextStyle(color: Colors.black)),
                  onPressed: onPressed),
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

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 0.5, color: Color.fromARGB(221, 216, 212, 212)))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: SizedBox(
                  width: 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: ImageRect(value: model?.jobimage),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model?.jobpeople ?? '-',
                              style: const TextStyle(fontSize: 15),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              model?.jobposition ?? '-',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              userJudge != true
                  ? btnFlatButtonWidget(
                      width: 90,
                      borderRadius: BorderRadius.circular(8.0),
                      fontColor: Colors.cyan.shade200,
                      title: "投递简历",
                      onPressed: showDeleteConfirmDialog1)
                  : btnFlatButtonWidget(
                      width: 90,
                      gbColor: Colors.grey,
                      borderRadius: BorderRadius.circular(8.0),
                      title: "已投递",
                      onPressed: () {})
            ],
          ),
        ),
        _titleItme(context, title: '福利', vaule: model?.jobboon),
        _titleItme(context, title: '招聘详情', vaule: model?.jobtitle),
        _titleItme(context, title: '具体新酬', vaule: model?.jobsalary),
        _titleItme(context, title: '合同时长', vaule: model?.jobtime),
        _titleItme(context, title: '招聘人数', vaule: model?.jobroute),
        _titleItme(context, title: '船舶类型', vaule: model?.jobdeadline),
        _titleItme(context, title: '截止日期', vaule: model?.jobcity),
        _titleItme(context, title: '招聘公司', vaule: model?.jobcompany),
      ],
    );
  }

  Widget _titleItme(BuildContext context, {String? title, String? vaule}) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.5, color: Color.fromARGB(221, 216, 212, 212)))),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '',
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            vaule ?? '-',
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
