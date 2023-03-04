import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditCareerPlanningBloc extends ProviderModel {
  Dio dio = Dio();
  void putPlanning(
    String? future,
    String? industry,
    String? salary,
    String? target,
    String? planning,
  ) async {
    var api = '${Config.domain}/edit_career';
    var userInfo = await UserServices.getUserInfo();
    var response = await dio.put(api, data: {
      "user_id": userInfo["id"],
      "future": future,
      "industry": industry,
      "salary": salary,
      "target": target,
      "planning": planning,
    });
    if (response.data["code"] == '0') {
      await Storage.setString("editCareer", json.encode(response.data["data"]));
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
  }
}
