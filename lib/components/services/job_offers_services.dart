import 'dart:convert';

import 'package:flutter_tast/components/utils/utils.dart';

class JobOffersServices {
  static Future<Map<String, dynamic>> getUserInfo() async {
    Map<String, dynamic> editProject;
    try {
     editProject = json.decode(await Storage.getString('joboffers') ?? '');
    } catch (e) {
      editProject = {};
    }
    return editProject;
  }

  static getUserLoginState() async {
    var editProject = await JobOffersServices.getUserInfo();
    return editProject["user_id"] != null;
    
  }

  static loginOut() {
    Storage.remove('joboffers');
  }
}