import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_tast/components/config/api.dart';
import 'package:flutter_tast/components/config/config.dart';
import 'package:flutter_tast/components/model/model.dart';
import 'package:flutter_tast/components/utils/utils.dart';
import 'package:flutter_tast/components/widgets/provider_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditResumeBloc extends ProviderModel {
  Dio dio = Dio();
  Api? _api;
  EditResumeBloc(Api api) {
    _api = api;
  }
  UserHomeModel? userHomeModel;
  Future<UserHomeModel?> getUser() async {
    loadingg(true);
    userHomeModel = await _api?.postUser();
    loadingg(false);
    return userHomeModel;
  }

  void putUser(String username, String nickname, String sex, String identity,
      String educational, String address, String images, String age) async {
    var userInfo = await UserServices.getUserInfo();
    var api = "${Config.domain}/user";
    var response = await Dio().put(api, data: {
      "id": userInfo['id'],
      "username": username,
      "nickname": nickname,
      "sex": sex,
      "identity": identity,
      "educational": educational,
      "age": int.parse(age),
      "address": address,
      "images": images
    });
    if (response.data["code"] == '0') {
      await Storage.setString('userInfo', json.encode(response.data["data"]));
    } else {
      Fluttertoast.showToast(
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          msg: "${response.data['msg']}");
    }
  }
}
