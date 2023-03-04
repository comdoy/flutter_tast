import 'package:flutter/material.dart';
import 'package:flutter_tast/router/router.dart';

class CertificatePages extends StatefulWidget {
  const CertificatePages({Key? key}) : super(key: key);

  @override
  State<CertificatePages> createState() => _CertificatePagesState();
}

class _CertificatePagesState extends State<CertificatePages> {
  String images =
      'https://pic4.zhimg.com/50/v2-6afa72220d29f045c15217aa6b275808_hd.jpg?source=1940ef5c';
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          tooltip: '返回上一页',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(true);
            //_nextPage(-1);
          },
        ),
        // automaticallyImplyLeading : true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.accessible_forward))
        ],
        title: const Text("个人证书"),
      ),
      body: Container(
        color: const Color.fromARGB(255, 246, 246, 248),
        child: ListView(
          children: [
            Container(
              height: 180,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Application.router.navigateTo(context, '/editresume');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("姓名： 杨俊"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("性别： 男       民族：侗族"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("出生： 1996  年  6  月  24  日"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("住址： 贵州省玉屏侗族自治县朱朱家场镇兴隆村街上组"),
                                SizedBox(
                                  height: 8,
                                ),
                                
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  child: ClipRRect(
                                    child: Image.network(images),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  width: 90,
                                  height: 120,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                        child: Text("公民身份证号码：522223 1996 06 24 2013"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 180,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Application.router.navigateTo(context, '/editresume');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 32,
                                ),
                                Text("  杨      俊"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("  成绩    合格"),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: const [
                                Text(
                                  "全国计算机等级考试",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text("二级合格证书"),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  child: ClipRRect(
                                    child: Image.network(images),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  width: 60,
                                  height: 60,
                                ),
                                const Text("c语言程序设计"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("身份证件号：454545454545454"),
                                SizedBox(
                                  height: 6,
                                ),
                                Text("准 考  证 号：254545454545454"),
                                SizedBox(
                                  height: 6,
                                ),
                                Text("证 书  编 号：254545454545454"),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: const [
                                Text(
                                  "教育部考试中心",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  "    No.2170140492",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 252, 108, 98)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 180,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Application.router.navigateTo(context, '/editresume');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 32,
                                ),
                                Text("杨  俊  "),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("总分:    627"),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: const [
                                Text(
                                  "大学英语四级考试",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text("成绩报告单"),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  child: ClipRRect(
                                    child: Image.network(images),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  width: 60,
                                  height: 60,
                                ),
                                const Text("英语四级考试"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              width: 7,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("身份证件号：454545454545454"),
                                const SizedBox(
                                  height: 6,
                                ),
                                const Text("准 考  证 号：254545454545454"),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                    "考 试  时 间：${dateTime.year}  年  ${dateTime.month} 月 ${dateTime.day} 日"),
                              ],
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Column(
                              children: const [
                                Text(
                                  "教育部高等教育司",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Text(
                                  "英语四级考试委员会",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 252, 108, 98)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 180,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Application.router.navigateTo(context, '/editresume');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "普通高等学校",
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                const Text(
                                  "毕业证书",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Row(
                                  children: [
                                    const Text("学生 杨俊 "),
                                    Text(
                                        "于 ${dateTime.year} 年 ${dateTime.month} 月 "),
                                    Text(
                                        "至 ${dateTime.year} 年 ${dateTime.month} 月"),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text("在 数据科学与大数据技术"),
                                    Text("专业 四 年制本"),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text("科学习，成绩合格，准予毕业。"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                // SizedBox(
                                //   height: 5,
                                // ),
                                SizedBox(
                                  child: ClipRRect(
                                    child: Image.network(images),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  width: 98,
                                  height: 90,
                                ),
                                const Text("英语四级考试"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("校名：遵义师范学院"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("查询网址：www.baidu.com"),
                                SizedBox(
                                  height: 2,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 45,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "遵义师范学院印制",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                    "${dateTime.year} 年 ${dateTime.month} 月 ${dateTime.day} 日"),
                                const Text(
                                  "345345345345",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 252, 108, 98)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 180,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: InkWell(
                onTap: () {
                  Application.router.navigateTo(context, '/editresume');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "普通高等学校",
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                const Text(
                                  "学士学位证书",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Row(
                                  children: [
                                    const Text("学生 杨俊 "),
                                    Text(
                                        "于 ${dateTime.year} 年 ${dateTime.month} 月 "),
                                    Text(
                                        "至 ${dateTime.year} 年 ${dateTime.month} 月"),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text("在 数据科学与大数据技术"),
                                    Text("专业 四 年制本"),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Text("科学习，成绩合格，准予毕业。"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                // SizedBox(
                                //   height: 5,
                                // ),
                                SizedBox(
                                  child: ClipRRect(
                                    child: Image.network(images),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                  ),
                                  width: 98,
                                  height: 90,
                                ),
                                const Text("英语四级考试"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("校名：遵义师范学院"),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("查询网址：www.baidu.com"),
                                SizedBox(
                                  height: 2,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 45,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "遵义师范学院印制",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                    "${dateTime.year} 年 ${dateTime.month} 月 ${dateTime.day} 日"),
                                const Text(
                                  "345345345345",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 252, 108, 98)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
