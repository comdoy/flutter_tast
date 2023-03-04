import 'dart:convert';

import 'package:flutter_tast/components/utils/utils.dart';

class EditEducateServices {
  static Future<Map<String, dynamic>> getUserInfo() async {
    Map<String, dynamic> editEducate;
    try {
      editEducate = json.decode(await Storage.getString('editEducate') ?? '');
    } catch (e) {
      editEducate = {};
    }
    return editEducate;
  }

  static getUserLoginState() async {
    var editEducate = await EditEducateServices.getUserInfo();
    return editEducate["user_id"] != null;
    
  }

  static loginOut() {
    Storage.remove('editEducate');
  }
}