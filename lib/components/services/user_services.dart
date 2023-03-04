import 'dart:convert';

import 'package:flutter_tast/components/utils/utils.dart';



class UserServices {
  static Future<Map<String, dynamic>> getUserInfo() async {
    Map<String, dynamic> userinfo;
    try {
      userinfo = json.decode(await Storage.getString('userInfo') ?? '');
    } catch (e) {
      userinfo = {};
    }
    return userinfo;
  }

  static getUserLoginState() async {
    var userInfo = await UserServices.getUserInfo();
    return userInfo["username"] != null;
    
  }

  static loginOut() {
    Storage.remove('userInfo');
  }
}
