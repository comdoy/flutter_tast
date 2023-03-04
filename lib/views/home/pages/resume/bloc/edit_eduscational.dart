import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditEduscationalBloc extends ProviderModel {

  Dio dio = Dio();

  void putEduscat(
    String? graduatedschool,
    String? profession,
    String? period,
    String? whether,
    String? education,
    String? experience,
  ) async {
    var userInfo = await UserServices.getUserInfo();
    var api = '${Config.domain}/edit_educate';
    var response = await dio.put(api, data: {
      "user_id": userInfo["id"],
      "graduatedschool": graduatedschool,
      "profession": profession,
      "period": period,
      "whether": whether,
      "education": education,
      "experience": experience,
    });
    if (response.data["code"] == "0") {
       await Storage.setString(
              "editEducate", json.encode(response.data["data"]));
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "修改成功。。。");
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
  }
}
