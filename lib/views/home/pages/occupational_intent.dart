import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/services/services.dart';
import 'package:flutter_tast/components/style/style.dart';
import 'package:flutter_tast/components/utils/storage_datas.dart';
import 'package:flutter_tast/components/widgets/pickers.dart';
import 'package:flutter_tast/components/widgets/show_modal_bottom.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OccupationalIntent extends StatefulWidget {
  const OccupationalIntent({Key? key}) : super(key: key);

  @override
  State<OccupationalIntent> createState() => _OccupationalIntentState();
}

class _OccupationalIntentState extends State<OccupationalIntent> {
  Map<String, dynamic>? occupationalIntent;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _getoccupational();
  }

  _getoccupational() async {
    var userInfo = await UserServices.getUserInfo();
    var api = '${Config.domain}/occupational/career';
    var response = await dio.post(api, data: {"user_id": userInfo["id"]});
    await Storage.setString("occupational", json.encode(response.data["data"]));
    var occupationalIntent = await OccupationalServices.getUserInfo();
    setState(() {
      this.occupationalIntent = occupationalIntent;
      if (occupationalIntent["status"] != null) {
        status = occupationalIntent["status"];
      }
      if (occupationalIntent["jobsearch"] != null) {
        jobSearch = occupationalIntent["jobsearch"];
      }

      if (occupationalIntent["jobsearch"] != null) {
        _jobSearchController.text = occupationalIntent["jobsearch"];
      }

      if (occupationalIntent["companysize"] != null) {
        companySize = occupationalIntent["companysize"];
      }

      if (occupationalIntent["expectbenefits"] != null) {
        expectBenefits = occupationalIntent["expectbenefits"];
      }
      if (occupationalIntent["workinghours"] != null) {
        workingHours = occupationalIntent["workinghours"];
      }
      if (occupationalIntent["locations"] != null) {
        var str = occupationalIntent["locations"].split(' ');
        workCity = str;
      }
    });
  }

  Dio dio = Dio();
  occupationalinfo() async {
    var userInfo = await UserServices.getUserInfo();
    var api = '${Config.domain}/occupational/career';
    var response = await dio.post(api, data: {"user_id": userInfo["id"]});

    if (response.data["code"] == "0") {
      var apis = '${Config.domain}/occupational';

      var responses = await dio.put(apis, data: {
        "user_id": userInfo["id"],
        "status": status,
        "jobsearch": jobSearch,
        "companysize": companySize,
        "workcity": workCityName(
            pname: workCity[0], cname: workCity[1], tname: workCity[2]),
        "expectbenefits": expectBenefits,
        "workinghours": workingHours,
      });
      if (responses.data["code"] == "0") {
        await Storage.setString(
            "occupational", json.encode(responses.data["data"]));
        Navigator.pop(context);
      } else {
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            msg: "${responses.data['msg']}");
      }
    } else {
      var apia = '${Config.domain}/occupational/add_career';
      var responsea = await dio.post(apia, data: {
        "userid": userInfo["id"],
        "status": status,
        "jobsearch": jobSearch,
        "companysize": companySize,
        "workcity": workCityName(
            pname: workCity[0], cname: workCity[1], tname: workCity[2]),
        "expectbenefits": expectBenefits,
        "workinghours": workingHours
      });
      if (responsea.data["code"] == "0") {
        await Storage.setString(
            "occupational", json.encode(response.data["data"]));
        Navigator.pop(context);
      } else {
        Fluttertoast.showToast(
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            msg: "${responsea.data['msg']}");
      }
    }
    // var carouseModel = Carousel_model.fromJson(response.data);
    // List<Records> recordList = carouseModel.data.records;
    // setState(() {
    //   _carouselList = recordList;
    // });
  }

  Widget textFormItmes(String title, void Function()? onTap, String value) {
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
                    value,
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
                      hintText: "?????????",
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

  final TextEditingController _jobSearchController = TextEditingController();

  ///????????????
  String status = '-';

  ///????????????
  String jobSearch = '-';

  ///????????????
  String companySize = '-';

  ///????????????
  List workCity = ['', '', ''];

  ///????????????
  String expectBenefits = '-';

  ///??????????????????
  String workingHours = '-';

  List<String> statusList = ["????????????", "????????????", "????????????", "????????????", "????????????", "????????????"];
  List<String> companySizeList = ["??????", "??????", "????????????", "????????????", "????????????", "???????????????"];
  List<String> expectBenefitsList = [
    "??????????????????",
    "??????????????????",
    "????????????",
  ];
  List<String> workingHoursList = ["996", "?????????", "???9???6", "???8???5", "????????????"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("??????????????????"),
        actions: [
          TextButton(
              onPressed: occupationalinfo,
              child: const Text(
                "??????",
                style: TextStyle(
                    color: Color.fromARGB(255, 54, 42, 42), fontSize: 16),
              ))
        ],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: ListView(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          children: [
            textFormItmes("????????????", () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              ShowBottomSheet.showText(context, dataArr: statusList,
                  clickCallback: (index, text) {
                setState(() {
                  status = text;
                });
              });
            }, status),
            textFormItme('????????????', (p0) {
              jobSearch = p0;
            }, controller: _jobSearchController),
            const Text(
              "?????????????????????????",
              style: TextStyle(color: Color.fromARGB(255, 218, 197, 79)),
            ),
            textFormItmes("????????????", () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              ShowBottomSheet.showText(context, dataArr: companySizeList,
                  clickCallback: (index, text) {
                setState(() {
                  companySize = text;
                });
              });
            }, companySize),
            textFormItmes(
              "????????????",
              () {
                Pickers.showAddressPicker(
                  context,
                  initProvince: workCity[0],
                  initCity: workCity[1],
                  initTown: workCity[2],
                  pickerStyle: RaisedPickerStyle(haveRadius: true),
                  addAllItem: false,
                  onConfirm: (p, c, t) {
                    setState(() {
                      workCity[0] = p;
                      workCity[1] = c;
                      workCity[2] = t;
                    });
                  },
                );
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              workCityName(
                  pname: workCity[0], cname: workCity[1], tname: workCity[2]),
            ),
            textFormItmes("????????????", () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              ShowBottomSheet.showText(context, dataArr: expectBenefitsList,
                  clickCallback: (index, text) {
                setState(() {
                  expectBenefits = text;
                });
              });
            }, expectBenefits),
            textFormItmes("??????????????????", () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
              ShowBottomSheet.showText(context, dataArr: workingHoursList,
                  clickCallback: (index, text) {
                setState(() {
                  workingHours = text;
                });
              });
            }, workingHours),
          ],
        ),
      ),
    );
  }

  String workCityName({String? pname, String? cname, String? tname}) {
    if (strEmpty(pname)) return '?????????';
    StringBuffer sb = StringBuffer();
    sb.write(pname);
    if (strEmpty(cname)) return sb.toString();
    sb.write(' ');
    sb.write(cname);
    if (strEmpty(tname)) return sb.toString();
    sb.write(' ');
    sb.write(tname);
    return sb.toString();
  }

  /// ???????????????
  bool strEmpty(String? value) {
    if (value == null) return true;

    return value.trim().isEmpty;
  }
}
