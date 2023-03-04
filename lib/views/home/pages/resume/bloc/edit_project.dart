import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditProjectBloc extends ProviderModel {
  Dio dio = Dio();

  void putProject(String? projectname, String? role, String? schedule,
      String? background, String? experience) async {
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/edit_project";
    var response = await dio.put(api, data: {
      "user_id": userInfo["id"],
      "projectname": projectname,
      "role": role,
      "schedule": schedule,
      "background": background,
      "experience": experience
    });
    if (response.data["code"] == '0') {
      await Storage.setString(
          "editProject", json.encode(response.data["data"]));
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
  }
}
