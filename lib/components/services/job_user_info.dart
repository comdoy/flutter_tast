import 'dart:convert';

import 'package:flutter_tast/components/utils/utils.dart';

class JobUserServices {
  static Future<Map<String, dynamic>> getJobUserInfo() async {
    Map<String, dynamic> jobUserInfo;
    try {
      jobUserInfo = json.decode(await Storage.getString('jobUserInfo') ?? '');
    } catch (e) {
      jobUserInfo = {};
    }
    return jobUserInfo;
  }

  static getUserLoginState() async {
    var jobUserInfo = await JobUserServices.getJobUserInfo();
    return jobUserInfo["recruiteraccount"] != null;
    
  }

  static loginOut() {
    Storage.remove('jobUserInfo');
  }
}