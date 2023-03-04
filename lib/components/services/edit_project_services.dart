import 'dart:convert';

import 'package:flutter_tast/components/utils/utils.dart';

class EditProjectServices {
  static Future<Map<String, dynamic>> getUserInfo() async {
    Map<String, dynamic> editProject;
    try {
     editProject = json.decode(await Storage.getString('editProject') ?? '');
    } catch (e) {
      editProject = {};
    }
    return editProject;
  }

  static getUserLoginState() async {
    var editProject = await EditProjectServices.getUserInfo();
    return editProject["user_id"] != null;
    
  }

  static loginOut() {
    Storage.remove('editProject');
  }
}