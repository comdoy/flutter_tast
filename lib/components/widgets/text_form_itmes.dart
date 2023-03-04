import 'package:flutter/material.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';

class TextFormCell extends StatelessWidget {
  ///常规类型
  const TextFormCell(
      {Key? key, required this.title, this.onChanged, this.controller})
      : super(key: key);
  final String title;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.5, color: Color.fromARGB(221, 216, 212, 212)))),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(fontSize: 16),
              )),
          Expanded(
            flex: 7,
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    cursorColor: const Color.fromARGB(255, 41, 204, 188),
                    onChanged: onChanged,
                    decoration: const InputDecoration(
                      hintText: "请输入",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TextFormOnTap extends StatelessWidget {
  ///弹窗类型
  const TextFormOnTap(
      {Key? key, required this.title, this.value, this.onTap})
      : super(key: key);
  final String title;
  final void Function()? onTap;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(221, 216, 212, 212)))),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                )),
            Expanded(
              flex: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    value??'-',
                    style: const TextStyle(fontSize: 16),
                  )),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFormImage extends StatelessWidget {
  ///图片类型
  const TextFormImage(
      {Key? key, required this.title, this.value, this.onTap})
      : super(key: key);
  final String title;
  final void Function()? onTap;
  final String? value;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.5, color: Color.fromARGB(221, 216, 212, 212)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16),
            ),
            SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    child: ImageRect(
                      value: value,
                    ),
                    width: 60,
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
