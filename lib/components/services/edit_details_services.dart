import 'dart:convert';

import 'package:flutter_tast/components/utils/utils.dart';

class EditDetailsServices {
  static Future<Map<String, dynamic>> getUserInfo() async {
    Map<String, dynamic> editresumedetails;
    try {
      editresumedetails = json.decode(await Storage.getString('editresumedetails') ?? '');
    } catch (e) {
      editresumedetails = {};
    }
    return editresumedetails;
  }

  static getUserLoginState() async {
    var editresumedetails = await EditDetailsServices.getUserInfo();
    return editresumedetails["user_id"] != null;
    
  }

  static loginOut() {
    Storage.remove('editresumedetails');
  }
}
