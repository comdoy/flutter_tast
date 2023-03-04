import 'dart:convert';

import 'package:flutter_tast/components/utils/utils.dart';

class EditCareerServices {
  static Future<Map<String, dynamic>> getUserInfo() async {
    Map<String, dynamic> editCareer;
    try {
      editCareer = json.decode(await Storage.getString('editCareer') ?? '');
    } catch (e) {
      editCareer = {};
    }
    return editCareer;
  }

  static getUserLoginState() async {
    var editCareer = await EditCareerServices.getUserInfo();
    return editCareer["user_id"] != null;
    
  }

  static loginOut() {
    Storage.remove('editCareer');
  }
}
