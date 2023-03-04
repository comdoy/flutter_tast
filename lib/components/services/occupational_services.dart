import 'dart:convert';

import 'package:flutter_tast/components/utils/utils.dart';

class OccupationalServices {
  static Future<Map<String, dynamic>> getUserInfo() async {
    Map<String, dynamic> occupational;
    try {
     occupational = json.decode(await Storage.getString('occupational') ?? '');
    } catch (e) {
      occupational = {};
    }
    return occupational;
  }

  static getUserLoginState() async {
    var occupational = await OccupationalServices.getUserInfo();
    return occupational["user_id"] != null;
    
  }

  static loginOut() {
    Storage.remove('occupational');
  }
}