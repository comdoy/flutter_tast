import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/services/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostJobs extends StatefulWidget {
  const PostJobs({Key? key, this.newid}) : super(key: key);
  final String? newid;

  @override
  State<PostJobs> createState() => _PostJobsState();
}

class _PostJobsState extends State<PostJobs> {
  final TextEditingController _jobtitleController = TextEditingController();
  final TextEditingController _jobtimeController = TextEditingController();
  final TextEditingController _jobdeadlineController = TextEditingController();
  final TextEditingController _jobrouteController = TextEditingController();
  final TextEditingController _jobcompanyController = TextEditingController();
  final TextEditingController _jobsalaryController = TextEditingController();
  final TextEditingController _jobboonController = TextEditingController();

  String jobtitle = '';
  String jobtime = '';
  String jobdeadline = '';
  String jobroute = '';
  String jobcompany = '';
  String jobsalary = '';
  String jobboon = '';


  Dio dio = Dio();
  _getIndustry() async {
    var userInfo = await JobUserServices.getJobUserInfo();
    var api = "${Config.domain}/job_offers";
    var response = await dio.post(api, data: {
      "recruiter_id": userInfo["id"],
      "jobimage": userInfo["recruiterimage"],
      "jobposition": userInfo["recruiterposition"],
      "jobpeople": userInfo["recruiterphone"],
      "jobcity": userInfo["recruitercity"],
      "jobtitle": jobtitle,
      "jobtime": jobtime,
      "jobdeadline": jobdeadline,
      "jobroute": jobroute,
      "jobcompany": jobcompany,
      "jobsalary": jobsalary,
      "jobboon": jobboon,
    });
    if (response.data["code"] == '0') {
      Navigator.pop(context,true);
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
  }

  Widget textFormItme(String title, void Function(String)? onChanged,
      {TextEditingController? controller}) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions: [
          IconButton(
              onPressed: () {
                _getIndustry();
              },
              icon: const Text("发布"))
        ], elevation: 0, centerTitle: true, title: const Text("发布新闻")),
        body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: Colors.white,
          ),
          child: ListView(
            children: <Widget>[
              textFormItme('招聘详情', (p0) {
                jobtitle = p0;
              }, controller: _jobtitleController),
              textFormItme('合同时长', (p0) {
                jobtime = p0;
              }, controller: _jobtimeController),
              textFormItme('截止日期', (p0) {
                jobdeadline = p0;
              }, controller: _jobdeadlineController),
              textFormItme('招聘人数', (p0) {
                jobroute = p0;
              }, controller: _jobrouteController),
              textFormItme('招聘公司', (p0) {
                jobcompany = p0;
              }, controller: _jobcompanyController),
              textFormItme('具体新酬', (p0) {
                jobsalary = p0;
              }, controller: _jobsalaryController),
              textFormItme('公司福利', (p0) {
                jobboon = p0;
              }, controller: _jobboonController),
            ],
          ),
        ));
  }
}
