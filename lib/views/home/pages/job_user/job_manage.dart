import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/services/job_user_info.dart';
import 'package:flutter_tast/router/applaction.dart';
import 'package:flutter_tast/components/model/job_offers_model.dart';
import 'package:flutter_tast/views/home/pages/home/components/all_job_offers_cell.dart';

class JobManage extends StatefulWidget {
  const JobManage({Key? key}) : super(key: key);

  @override
  State<JobManage> createState() => _JobManageState();
}

class _JobManageState extends State<JobManage> {
  List<OffersperItem> _manageList = [];
  var dio = Dio();

  @override
  void initState() {
    super.initState();
    _getJobManage();
  }

  _getJobManage() async {
    var jobManage = await JobUserServices.getJobUserInfo();
    var api =
        "${Config.domain}/job_offers/job_onea?pageNum=1&pageSize=10&search=${jobManage['id']}";
    var repse = await dio.get(api);
    var manageModel = JobOffersModel.fromJson(repse.data);
    List<OffersperItem> manageList = manageModel.data.records;
    setState(() {
      _manageList = manageList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Application.router.navigateTo(context, '/post_jobs');
                },
                icon: const Text("发布"))
          ],
          title: const Text("招聘信息管理")),
      body: ListView.builder(
          itemCount: _manageList.length,
          itemBuilder: ((context, index) {
            return AllJobOffersCell(
              onTap: () {},
              model: _manageList[index],
            );

            // return Container(
            //   color: Theme.of(context).cardColor,
            //   padding: const EdgeInsets.all(8.0),
            //   margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            //   child: InkWell(
            //     onTap: () {},
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Container(
            //           padding: const EdgeInsets.only(
            //             top: 10,
            //           ),
            //           child: Flex(
            //             direction: Axis.horizontal,
            //             children: <Widget>[
            //               Expanded(
            //                 flex: 5,
            //                 child: Text(
            //                   _manageList[index].jobtitle ?? '-',
            //                   style: const TextStyle(
            //                       fontSize: 16, fontWeight: FontWeight.bold),
            //                 ),
            //               ),
            //               Expanded(
            //                 flex: 1,
            //                 child: Text(
            //                   _manageList[index].jobsalary ?? '-',
            //                   style: TextStyle(color: Colors.cyan[200]),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //         Container(
            //           padding: const EdgeInsets.only(
            //             top: 10,
            //           ),
            //           child: Column(
            //             children: <Widget>[
            //               Row(
            //                 children: <Widget>[
            //                   Container(
            //                     height: 36,
            //                     margin: const EdgeInsets.only(right: 10),
            //                     padding:
            //                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //                     decoration: BoxDecoration(
            //                       color: Colors.cyan[50],
            //                       borderRadius: BorderRadius.circular(5),
            //                     ),
            //                     child: Text(_manageList[index].jobboon ?? '-'),
            //                   ),
            //                   Container(
            //                     height: 36,
            //                     margin: const EdgeInsets.only(right: 10),
            //                     padding:
            //                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //                     decoration: BoxDecoration(
            //                       color: Colors.cyan[50],
            //                       borderRadius: BorderRadius.circular(5),
            //                     ),
            //                     child: Text(_manageList[index].jobtime ?? '-'),
            //                   ),
            //                   Container(
            //                     height: 36,
            //                     margin: const EdgeInsets.only(right: 10),
            //                     padding:
            //                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //                     decoration: BoxDecoration(
            //                       color: Colors.cyan[50],
            //                       borderRadius: BorderRadius.circular(5),
            //                     ),
            //                     child: Text(_manageList[index].jobroute ?? '-'),
            //                   ),
            //                   Container(
            //                     height: 36,
            //                     margin: const EdgeInsets.only(right: 10),
            //                     padding:
            //                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //                     decoration: BoxDecoration(
            //                       color: Colors.cyan[50],
            //                       borderRadius: BorderRadius.circular(5),
            //                     ),
            //                     child:
            //                         Text(_manageList[index].jobdeadline ?? '-'),
            //                   ),
            //                 ],
            //               ),
            //               const SizedBox(
            //                 height: 10,
            //               ),
            //               Row(
            //                 children: [
            //                   Container(
            //                     height: 36,
            //                     margin: const EdgeInsets.only(right: 10),
            //                     padding:
            //                         const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //                     decoration: BoxDecoration(
            //                       color: Colors.cyan[50],
            //                       borderRadius: BorderRadius.circular(5),
            //                     ),
            //                     child: Text(_manageList[index].jobcity ?? '-'),
            //                   ),
            //                 ],
            //               ),
            //             ],
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.only(top: 10, bottom: 10),
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: <Widget>[
            //               SizedBox(
            //                 child: Row(
            //                   children: [
            //                     SizedBox(
            //                       width: 25,
            //                       height: 25,
            //                       child: ClipRRect(
            //                         child: Image.network(
            //                             '${Config.domain}/${_manageList[index].jobimage}'),
            //                         borderRadius: BorderRadius.circular(8),
            //                       ),
            //                     ),
            //                     Text(
            //                       " ${_manageList[index].jobpeople} .${_manageList[index].jobposition}",
            //                       style: const TextStyle(fontSize: 14),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //               Text(
            //                 _manageList[index].jobcompany ?? '-',
            //                 style: TextStyle(color: Colors.cyan[200]),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // );
          
          })),
    );
  }
}
