import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditAdvantageBloc extends ProviderModel {
  Dio dio = Dio();
  void putAdvantage(String? advantagename, String? responsmodule,
      String? advantagecontent) async {
    loadingg(false);
    var userInfo = await UserServices.getUserInfo();
    var api = '${Config.domain}/edit_advantage';
    var response = await Dio().put(api, data: {
      "user_id": userInfo['id'],
      "advantagenames": advantagename,
      "responsmodule": responsmodule,
      "advantagecontents": advantagecontent,
    });
    if (response.data["code"] == '0') {
      await Storage.setString(
          'editresumedetails', json.encode(response.data["data"]));
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
    loadingg(false);
  }
}
